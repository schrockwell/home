---
title: SundiaLED
---

*SundiaLED is a linear clock that uses a string of LEDs to indicate sunrise, sunset, and the current position of the sun.*

{% include img.html src="sundialed/hero.jpg" alt="SundiaLED" %}

Powered by an [Adafruit Feather M0](https://www.adafruit.com/product/2772), it uses GPS to automatically determine the sun's position and length of the day based on the current longitude, latitude, and date.

## TODO

- [x] Working prototype
- [ ] Add (or fully convert to) RTC for time (GPS doesn't always acquire very well indoors…)
- [ ] Publish source code
- [ ] Publish basic plans & schematic

## Ideas

Maybe a *round* version, like an actual sundial/clock, makes more sense? Certainly would be easier to find a spot on the wall for it.

An LDR sensor for auto-dimming would be neat.

## Build Log


### 1/21/24
Meticulous planning.

{% include img.html src="sundialed/plans.jpg" %}

### 2/17/24
Got some shop time in this afternoon. Everything is cut and ready to assemble, just need to order the right size Kreg screws

{% include img.html src="sundialed/build-1.jpg" %}

Painted the inside flat white, which should help with the LED diffusion I hope?

{% include img.html src="sundialed/build-2.jpg" %}

Assembled the Adafruit Feather M0 with GPS module for time and location sync.

{% include img.html src="sundialed/build-3.jpg" %}

### 2/20/24
First time trying iron-on veneer for plywood. I’m sold. It looks amazing and it’s not hard at all, just a little tedious

{% include img.html src="sundialed/build-4.jpg" %}