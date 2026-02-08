---
title: METAR maps
---

*Visualizing METAR weather data on a map*

I have built two 24x36" maps that display airport weather conditions using individually-addressable LEDs. They are powered by Raspberry Pi Zero W's running [a custom Elixir Nerves application](https://github.com/schrockwell/metar_map_nerves).

They are constructed from MDF with a printed map glued on top. LEDs shine through the map, making it magically come alive when powered on. They also have [LDR sensors](https://en.wikipedia.org/wiki/Photoresistor) to automatically dim the LEDs when the room is dark. The frames are custom-made 1x3" stained pine.

[Source code](https://github.com/schrockwell/metar_map_nerves)

| Conditions (best to worst)    | Color   |
| ----------------------------- | ------- |
| VFR (Visual Flight Rules)     | Green   |
| MVFR (Marginal VFR)           | Blue    |
| IFR (Instrument Flight Rules) | Red     |
| LIFR (Low IFR)                | Magenta |


{% include img.html src="metar/hero.jpeg" alt="METAR map of the northeast" caption="The first map of the northeast" %}

{% include img.html src="metar/hero-2.jpeg" alt="METAR map of southern Florida" caption="The second map of southern Florida" %}

---

## Build process

{% include img.html src="metar/build-1.jpeg" caption="Testing out WS2812 LEDs" %}

{% include img.html src="metar/build-2.jpeg" caption="Tracing every airport from the printed map" %}

{% include img.html src="metar/build-3.jpeg" caption="Transferring airport locations to MDF using an awl" %}

{% include img.html src="metar/build-4.jpeg" caption="Drilling 1/4 inch holes for each airport" %}

{% include img.html src="metar/build-5.jpeg" caption="Gluing LEDs through the MDF" %}

{% include img.html src="metar/build-6.jpeg" caption="First light!" %}

{% include img.html src="metar/build-7.jpeg" caption="Shining through the glued-on map" %}

{% include img.html src="metar/hero.jpeg" caption="With the custom frame" %}