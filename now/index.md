---
title: What I'm doing now
---

*Updated March 1, 2026*

*This is a [now page](https://sive.rs/nowff). You can also read what happened [then](/then).*

## Work

I'm currently splitting time betwen [Remote Ham Radio](https://www.remotehamradio.com) and [TRMNL](https://trmnl.com).

At RHR, the [Desecho Island DXpeditino](https://desecheo2026.com/kp5/) has passed 100,000 contacts in just over a month. It's been about 50% FT4 and FT8, 30% CW, and 20% phone. Not bad for an unattended station with marginal antennas.

At [TRMNL](https://trmnl.com/), work continues to prepare to TRMNL X. We are also doing a lot in the BYOD (Bring Your Own Device) space.

## Rewriting SOTA Goat in Swift

My iOS app [SOTA Goat](https://ww1x.radio/sotagoat/) has been written entirely in Objective-C since its inception in 2012. I didn't hate that, but it was a barrier that prevented me from actively working on the app. It badly needed updates for iOS 26, plus I wanted to add some features that folks had been requesting for years.

Over the course of a few days – and this is going to be a common theme running through this month's summary – I worked with Claude to gradually migrate the codebase over to Swift. Objective-C and Swift files happily coexist in the same Xcode project, so I took a very mediated approach, migrating only one or two files at a time, testing, and committing. I started with with the core, foundational files and purely-functional utilities, then worked my way up to the most complex classes. I kept everything in UIKit, opting out of SwiftUI, as it would give no benefit.

By the end of it, I had a 100% Swift application with no regressions, clean refactors, a couple new features, and a modern UI. And it was approved to [the App Store](https://apps.apple.com/us/app/sota-goat/id590206108) on the first review! I'll take the W.

## Moving Personal Projects From Postgres to SQLite

I continued the task of standardizing and simplifying [the stack that runs my personal web apps](/dev/hosting.html). This month, I tackled Postgres. As amazing as it is, it's simply overkill for my tiny applications with basic database needs that get effectively zero traffic.

I got back together with Claude and migrated four Phoenix web apps to SQLite. The transition went well, and now I have a portable, easily-backed-up, self-hosted datastore. Plus it saves 15 bucks a month on managed Postgres.

## Game Boy Camera <> TRMNL

{% include img.html src="/dev/gbcmr/hero.jpeg" href="/dev/gbcmr.html" %}

This was a silly weekend project that actually turned out really nice: [GBCMR](https://gbcmr.schrockwell.com/). No, I don't know how to pronounce it.

There are details in [the writeup](/dev/gbcmr.html). This was a fully vibe-coded session that involved Claude doing some things that were new to me - namely converting a serial device driver [from Python](https://github.com/Lesserkuma/FlashGBX) to TypeScript, and directly accessing a physical Game Boy cartridge to debug its implementation. Giving an LLM access to external hardware felt… wrong. But it was necessary to get the job done.

It wrote the UI in React. That wouldn't be my first choice (or second, or third), but heck, it can be rewritten in Vue or Svelte in the future if I want to dive in to the codebase.

The end result is a single-serving app that is super fun to use. I love seeing grainy, dithered, low-contrast, pixelated images on my TRMNL throughout the day. It's such a good fit.

## Palm Handhelds

In the same low-fi-tech vein, I picked up a [Handspring Visor](https://en.wikipedia.org/wiki/Handspring,_Inc.#Visor_and_Visor_Deluxe) off eBay for nostalgia's sake. I've been [documenting resources](/retro/palm.html) as I find them.

It turns out that [someone wrote a TypeScript library](https://github.com/jichu4n/palm-sync) that communicates directly with Palm devices *in the browser*. Whoa.

So it was off to the races again, vibing a little app to implement basic sync features. It's called CoolSync, and its headlining features are currently installing PRC applications (my primary need), and pulling down ICS feeds to add to the calendar.

It can also read memos and to-dos, but I'm not sure what direction to take that yet. I don't want to just recreate [Palm Desktop](https://palmdb.net/app/palm-desktop) on the web, and syncing with third-party [PIM](https://en.wikipedia.org/wiki/Personal_information_management) services just sounds like a pain.

Once I figure out a stable, useful feature set, I'll host and open-source it.

## Water Leak

We had a water leak in the heating pipes of our basement. It took several days to locate because it was buried in the middle of the wall. In the meantime, the slow drip completely soaked destroyed the laminate flooring. Our makerspace is down there, including the workbench where I do all my hardware hacking. Hardware restoration projects are on hold until we can get everything out of there to replace the flooring.