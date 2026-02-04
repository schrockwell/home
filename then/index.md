---
title: Then
---

then

<ul>
  <li><a href="/now">now</a></li>
  {% for page in site.categories.then %}
    <li><a href="{{ page.url }}">{{ page.date | date: "%B %Y" }}</a></li>
  {% endfor %}
</ul>