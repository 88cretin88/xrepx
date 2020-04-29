import json
import urllib.request
from os.path import isdir, isfile
from time import time

html = """
<div class="padded_content flex_grow flex column">
	<h3>Choose mirror<i>(s) (Optional)</i></h3>
	<span>Here's your chance to select region/specific mirrors.<br>{additional_info}</span>

	<h3>Choose all mirrors from a region</h3>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="country_code" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Write country code(s), separate with , <i>(Ex: SE,UK = Sweden and United Kingdom)</i>.</span>
			</label>
		</div>
	</div>

	<h3>Add a custom mirror</h3>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="mirror_name" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Name of mirror<i>(Ex: local_repo</i>.</span>
			</label>
		</div>
	</div>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="mirror_url" required autocomplete="off" />
			<label class="label">
				<span class="label-content">URL to custom mirror <i>(Ex: http://192.168.0.1/$repo/os/$arch)</i>.</span>
			</label>
		</div>
	</div>

	<h3>Official active mirrors</h3>
	<select id="mirrorlist" multiple>

	</select>

	<div class="buttons bottom">
		<button id="save_mirrors">Save mirrorlist<i>(s)</i></button>
	</div>
</div>
"""

## TODO:
## Needs to be loaded this way, since we can't inject JS into divs etc in the HTML above.
javascript = """

document.querySelector('#save_mirrors').addEventListener('click', function() {
	let mirrors = {};
	let mirror_list = document.querySelector('#mirrorlist');
	Array.from(mirror_list.options).forEach(function(option_element) {
		let option_text = option_element.text;
		let option_value = option_element.value;
		let is_option_selected = option_element.selected;

		if (is_option_selected) {
			mirrors[option_value] = option_element.getAttribute('country');
		}
	});

	socket.send({
		'_install_step' : 'mirrors',
		'mirrors' : {
			'region' : document.querySelector('#country_code').value,
			'specific' : mirrors,
			'mirror_name' : document.querySelector('#mirror_name').value,
			'mirror_url' : document.querySelector('#mirror_url').value
		}
	})
})

window.refresh_mirrorlist = () => {
	let mirrorlist_dropdown = document.querySelector('#mirrorlist');

	window.mirror_list['urls'].forEach((mirrorlist_info) => {
		if(!mirrorlist_info['active'])
			return
		if(mirrorlist_info['protocol'] !== 'https')
			return

		let option = document.createElement('option');
		option.value = mirrorlist_info['url'];
		option.setAttribute('country', mirrorlist_info['country']);
		option.innerHTML = mirrorlist_info['country'] + ' (' + mirrorlist_info['url'] + ')';

		mirrorlist_dropdown.appendChild(option);
	})
}

window.update_mirrorlist = (data) => {
	if(typeof data['mirrorlist'] !== 'undefined') {
		window.mirror_list = data['mirrorlist'];
		window.refresh_mirrorlist();
	}
}

/* Sweden */
//Server = https://mirror.osbeck.com/archlinux/$repo/os/$arch

if(socket.subscriptions('mirrors') != 2)
	socket.subscribe('mirrors', update_mirrorlist);

socket.send({'_install_step' : 'mirrors', 'mirrors' : 'refresh'})

"""

def notify_mirrors_complete(worker, *args, **kwargs):
	sockets[worker.client.sock.fileno()].send({
		'type' : 'notification',
		'source' : 'mirrors',
		'message' : 'Filter and ordered mirrors!',
		'status' : 'complete'
	})

def notify_mirror_updates(worker, *args, **kwargs):
	sockets[worker.client.sock.fileno()].send({
		'type' : 'notification',
		'source' : 'mirrors',
		'message' : 'Reorderings mirrors.',
		'status' : 'active'
	})

class parser():
	def parse(path, client, data, headers, fileno, addr, *args, **kwargs):
		if '_install_step' in data and data['_install_step'] == 'mirrors':
			if not 'mirrors' in data:
				if not 'pacstrap' in progress:
					additional_info = "Installation of packages have not yet begun, so there's still time to change desired mirror for the installation process."
				else:
					additional_info = "Installation has begun, so these changes won't take affect until you're in the installed system."
				
				yield {
					'html' : html.format(additional_info=additional_info),
					'javascript' : javascript
				}
			else:
				if data['mirrors'] == 'refresh':
					## https://www.archlinux.org/mirrors/status/json/
					## https://www.archlinux.org/mirrorlist/?country=SE&protocol=https&use_mirror_status=on
					if not 'mirrors' in storage or time() - storage['mirrors']['last_check'] > storage['mirrors']['check_frequency']:
						log(f'Getting latest mirrors from archlinux.org', level=4, origin='api.mirrors')
						with urllib.request.urlopen('https://www.archlinux.org/mirrors/status/json/') as url:
							json_data = json.loads(url.read().decode())
							storage['mirrors'] = json_data
							storage['mirrors']['last_check'] = time() # Replace STRFTIME format with unix timestamp.

					yield {
						'status' : 'success',
						'mirrorlist' : storage['mirrors']
					}
				elif type(data['mirrors']) == dict:
					storage['mirror_region'] = data['mirrors']['region']
					storage['mirror_specific'] = data['mirrors']['specific']
					storage['custom_mirror'] = {'name' : data['mirrors']['mirror_name'], 'url' : data['mirrors']['mirror_url']}
					log(f"Storing selected mirrors. Region: {storage['mirror_region']}, Specifics: {storage['mirror_specific']}", level=4, origin='api.mirrors')

					sync_mirrors = None
					specific_mirrors = None
					if storage['mirror_region']:
						sync_mirrors = spawn(client, archinstall.filter_mirrors_by_country_list, start_callback=notify_mirror_updates, callback=notify_mirrors_complete, countries=storage['mirror_region'])#, dependency='formatting') # NOTE: This updates the live/local mirrorlist, which will be copied in the install steps later by pacstrap.

					if storage['mirror_specific']:
						if not storage['mirror_region']:
							# Before adding specific mirrors, flush the default mirrors if we didn't supply a specific region as well.
							# A region (SE) could for instance have been selected, then we won't flush that but simply add additional ones.
							sync_mirrors = spawn(client, archinstall.flush_all_mirrors)
						specific_mirrors = spawn(client, archinstall.add_specific_mirrors, start_callback=notify_mirror_updates, callback=notify_mirrors_complete, mirrors=storage['mirror_specific'], dependency=sync_mirrors)

					if storage['custom_mirror']['name'] and storage['custom_mirror']['url']:
						if not storage['mirror_region'] and not storage['mirror_specific']:
							sync_mirrors = spawn(client, archinstall.flush_all_mirrors)

						dependency = sync_mirrors
						if specific_mirrors:
							dependency = specific_mirrors
						spawn(client, archinstall.add_custom_mirror, **storage['custom_mirror'], start_callback=notify_mirror_updates, callback=notify_mirrors_complete, dependency=dependency)


					yield {
						'status' : 'success',
						'next' : 'hardware'
					}
