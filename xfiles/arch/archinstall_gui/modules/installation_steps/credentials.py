import json
from os.path import isdir, isfile

html = """
<div class="padded_content flex_grow flex column">
	<h3>Credentials</h3>
	<span>Here you'll configure a disk password, which <b>will also be your initial root password</b>.<br>Any additional users can be set up here as well any time during the installation process.<br>Simply come back here at any time to add or remove users.</span>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="password" id="disk_password" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Disk password:</span>
			</label>
		</div>
	</div>
	
	<h3>Create one additional user</h3>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="username" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Username:</span>
			</label>
		</div>
	</div>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="password" id="password" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Users password</span>
			</label>
		</div>
	</div>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="groups" required autocomplete="off" />
			<label class="label">
				<span class="label-content">User groups <i>(space separated)</i></span>
			</label>
		</div>
	</div>
	
	<h3>Add a machine hostname</h3>
	<div class="form-area" id="form-area">
		<div class="input-form" id="input-form">
			<input type="text" id="hostname" required autocomplete="off" />
			<label class="label">
				<span class="label-content">Give this machine a hostname on the network <i>(optional)</i></span>
			</label>
		</div>
	</div>
	<div class="buttons bottom" id="buttons">
		<button id="saveButton">Save configuration</button>
	</div>
</div>
"""

javascript = """
window.disk_password_input = document.querySelector('#disk_password');
window.hostname_input = document.querySelector('#hostname');

if(disk_password) {
	disk_password_input.value = disk_password;
	disk_password_input.disabled = true;
}

if(hostname) {
	hostname_input.value = hostname;
}

document.querySelector('#saveButton').addEventListener('click', function() {
	if(!disk_password) {
		disk_password = document.querySelector('#disk_password').value;
	}

	if(!hostname) {
		hostname = document.querySelector('#hostname').value;
	}

	socket.send({
		'_install_step' : 'credentials',
		'credentials' : {
			'disk_password' : disk_password,
			'username' : document.querySelector('#username').value,
			'password' : document.querySelector('#password').value,
			'groups' : document.querySelector('#groups').value,
			'hostname' : hostname
		}
	})
})
"""

def notify_credentials_saved(fileno, *args, **kwargs):
	sockets[fileno].send({
		'type' : 'notification',
		'source' : 'credentials',
		'message' : 'Credentials saved.',
		'status' : 'complete'
	})

class parser():
	def parse(path, client, data, headers, fileno, addr, *args, **kwargs):
		if '_install_step' in data and data['_install_step'] == 'credentials':
			if not 'credentials' in data:
				yield {
					'html' : html,
					'javascript' : javascript
				}
			else:
				## We got credentials to store, not just calling this module.
				if 'disk_password' in data['credentials'] and not 'formating' in progress:
					archinstall.args = archinstall.setup_args_defaults(archinstall.args) # Note: don't setup args unless disk password is present, since that might start formatting on drives and stuff
					archinstall.args['password'] = data['credentials']['disk_password']
					print(json.dumps(archinstall.args, indent=4))
				else:
					yield {
						'status' : 'failed',
						'message' : 'Can not set disk/root password after formatting has started.'
					}

				if 'hostname' in data['credentials']:
					archinstall.args['hostname'] = data['credentials']['hostname']

				if 'username' in data['credentials'] and data['credentials']['username']:
					archinstall.create_user(data['credentials']['username'], data['credentials']['password'], data['credentials']['groups'].split(' '))

				storage['credentials'] = data['credentials']
				notify_credentials_saved(fileno)

				yield {
					'status' : 'success',
					'next' : 'mirrors'
				}