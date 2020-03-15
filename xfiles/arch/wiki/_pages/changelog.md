---
title: Лог Изменений
permalink: /changelog/
---

Подпишись на <a href="{{ site.baseurl }}/feed.xml">RSS</a>, или на группу в VK <a target="_blank" href="https://vk.com/ctlos">vk.com/ctlos</a>, чтобы быть в курсе последних обновлений.

Прошлые версии доступны для скачивания на данной странице <a target="_blank" href="https://github.com/ctlos/ctlosiso/releases">github.com releases</a>.

> Последние и наиболее актуальные версии представлены на странице загрузки <a target="_blank" href="https://ctlos.github.io/get">ctlos.github.io/get</a>. [![GitHub All Releases](https://img.shields.io/github/downloads/ctlos/ctlosiso/total.svg)](https://ctlos.github.io/get)
{: .warning}

> Свяжитесь с нами, если у Вас есть предложения, или пожелания [ctlos.github.io/contact](https://ctlos.github.io/contact).

<div class="changelog">
	{% for change in site.posts %}
		<div class="changelog-item">
			<h3>{{ change.title }}</h3>
			<p><span class="date">{{ change.date | date: "%B %d, %Y" }}</span> <span class="badge {{ change.type }}">{{ change.type }}</span></p>
			{{ change.content }}
		</div>
	{% endfor %}
</div>
