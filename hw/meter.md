---
title: ESPHome analog meter
---

*Converting an analog Western Electric meter to be used as a smart home gauge with ESPHome*

{% include img.html src="meter/hero.jpeg" alt="ESPHome analog meter" %}

## Components
- [NodeMCU ESP32](https://amzn.to/4dsGXc0)
- [Hammond 1455C801 enclosure](https://www.mouser.com/ProductDetail/Hammond-Manufacturing/1455C801?qs=Omd18uQ5iJG65Q2olOV0Dw%3D%3D&countryCode=US&currencyCode=USD)
- DC barrels
- 10k potentiometer
- 3D-printed panel
- 3D-printed mounting bracket
- [Alien Tape](https://amzn.to/4k5l98V)

## ESPHome config

{% include img.html src="meter/build-1.png" alt="ESP32 pinout" %}

```yaml
output:
  - platform: esp32_dac
    pin: GPIO25
    id: dac_output

number:
  - platform: template
    name: "My Gauge"
    optimistic: true
    min_value: 0
    max_value: 100
    step: 1
    set_action:
      lambda: |-
        id(dac_output).set_level(x / 100.0);
```

## Gallery

{% include img.html src="meter/build-2.jpeg" caption="Internals" %}

{% include img.html src="meter/build-3.jpeg" caption="Jammed in the enclosure" %}

{% include img.html src="meter/build-4.jpeg" caption="Mounted to the back of the meter" %}