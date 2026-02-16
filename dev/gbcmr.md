---
title: GBCMR - Game Boy Camera Meets TRMNL
---

{% include img.html src="gbcmr/hero.jpeg" alt="TRMNL e-ink screen with Game Boy Camera" %}

[Visit GBCMR](https://gbcmr.schrockwell.com) :: [Demo gallery](https://gbcmr.schrockwell.com/s/07c338f747b1)

---

The [Game Boy Camera](https://en.wikipedia.org/wiki/Game_Boy_Camera) is a perfect match for [TRMNL](https://trmnl.com/). They're both personal, minimal, and - most importantly - 2-bit grayscale.

That's why I created [GBCMR](https://gbcmr.schrockwell.com/). It fulfills a few goals:

1. Offload photos directly from Game Boy Camera with [GBxCart RW](https://www.gbxcart.com/)
2. Create and share photo galleries with your friends
3. Stream that gallery to TRMNL e-ink displays

## Photo Download and Conversion

This is pure JavaScript in the browser. It requires [WebSerial](https://caniuse.com/web-serial) support. Chrome, Edge, or related browsers are supported, but not Firefox or Safari.

The GBxCart driver was based off [FlashGBX](https://github.com/Lesserkuma/FlashGBX)'s Python implementation.

{% include img.html src="gbcmr/download.jpeg" alt="Transferring photos from the GBC" %}

The album of 30 photos is stored in SRAM, beginning at address `0x2000` and incrementing by `0x1000` for each subsequent image. The image format is optimally packed - each pixel takes up exactly two bytes. That's (128 width \* 112 height \* 2 bits) = 28,672 bits per photo, or 3,584 bytes.

[Jimp](https://www.npmjs.com/package/jimp) is used to draw the image, which is converted to a proper 2-bit grayscale PNG before saving to disk, reducing the file size by a third (compared to the default 8-bit RGBA). The resulting PNGs are even smaller than the 3.5 KB raw images due to PNG's lossless compression, typically coming in around 1.5 - 2 KB.

## Photo Galleries

There's no need for a fully-fledged account system, so it's "security through obscurity" here. Each gallery gets unique public and private URLs. The private URL permits uploading and removing images, and the public URL is read-only.

{% include img.html src="gbcmr/gallery.png" alt="TRMNL plugin URL generator" %}

## TRMNL Integration

The public URL also exposes a couple endpoints for images to be directly displayed on a TRMNL e-ink device. The photos are resized with integer scaling so that they remain pixel-perfect.

Simply use the URL generator built into GBCMR and copy the URL into the TRMNL's Alias plugin. A new photo will be shown every time - no need to refresh any data on TRMNL's side.

{% include img.html src="gbcmr/trmnl-form.png" alt="TRMNL plugin URL generator" %}