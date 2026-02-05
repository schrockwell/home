---
title: What I was doing then
---

*The archive of [/now](/now).*

<ul>
  {% for page in site.categories.then %}
    <li><a href="{{ page.url }}">{{ page.date | date: "%B %Y" }}</a></li>
  {% endfor %}
</ul>