---
title: Classic Mac resources
---

## Favorite System 6 software

- [Wallops](https://jcs.org/wallops) - modern (!) IRC client
- [NCSA Telnet 2.x](https://macintoshgarden.org/apps/ncsa-telnet) - for BBSes and ham radio DX clusters
- [Fetch](https://macintoshgarden.org/apps/fetch-212) - FTP client

## Development
- [Platform Guide: Classic Mac \| Bumbershoot Software](https://bumbershootsoft.wordpress.com/platform-guide-classic-mac/)
- [Macintosh Toolbox Essentials](https://developer.apple.com/library/archive/documentation/mac/pdf/MacintoshToolboxEssentials.pdf)

## Repairs & Maintenance

- [How to check an old computer before turning it on \| Cult of Mac](https://www.cultofmac.com/804204/check-an-old-computer/)
- [Making a 400k MFS Boot Floppy on Any Beige Mac](https://siber-sonic.com/mac/MFSbootfloppy.html)
- [Home - Recap-a-Mac](https://recapamac.com.au/)
- [Tune-O-Gear Ejection FIX & LUBE for Apple 800K & 1.44MB floppy drives - YouTube](https://www.youtube.com/watch?v=eC1nUblJpwQ)

## Information

- [Classic Mac Ports](https://whitefiles.org/tec/pgs/h10b.htm)
- [Macintosh Garden - Celebrating Macintosh Abandonware!](https://macintoshgarden.org/)
- [68kMLA](https://68kmla.org/bb/index.php)
- [Working with Macintosh Floppy Disks in the New Millennium](https://siber-sonic.com/mac/newmillfloppy.html)
- [List of Finder versions \| Apple Wiki \| Fandom](https://apple.fandom.com/wiki/List_of_Finder_versions)
- [WiFi DaynaPORT - BlueSCSI v2 Documentation](https://bluescsi.com/docs/WiFi-DaynaPORT)
- [System6](http://web.archive.org/web/20000524123352/http://home.wanadoo.nl/ruud.dingemans/html/system6.html)
- [Compact Macs \| Low End Mac](https://lowendmac.com/compact-macs/)
- [Get Your Old Mac Online](https://web.archive.org/web/20061016102319/http://www.jagshouse.com/GetYourCompactMacOnTheWeb.html)
- [Compatibility - BlueSCSI v2 Documentation](https://bluescsi.com/docs/Compatibility)
- [Changing Your Startup Drive](https://lowendmac.com/trouble/setboot.shtml)
- [Vintage Mac Boot Key Combos \| TinkerDifferent](https://tinkerdifferent.com/resources/vintage-mac-boot-key-combos.146/)

## Accessories & Hardware

- [RescueMyClassicMac](https://rescuemyclassicmac.com/)
- [Floppy Emu Disk Emulator for Apple II, Macintosh, and Lisa \| Big Mess o' Wires](https://www.bigmessowires.com/floppy-emu/)
- [floppydisk.com \| floppy disk](https://www.floppydisk.com/)
- [Browse products by TT Design on Tindie](https://www.tindie.com/stores/ttdesign/)
- [BlueSCSI](https://bluescsi.com/)
- [Disk Jockey](https://diskjockey.onegeekarmy.eu/)
- [Apple Rescue of Denver – We are the Life Preserver of your Mac – Both old and new!](https://applerescueofdenver.com/)
- [OS9.shop - Buy the Ultimate Mac OS 9 Machine, an Upgraded Mac mini G4](https://os9.shop/)
- [WiFi PC Cards for PowerBooks Running Mac OS 9 - Low End MacLow End Mac](https://lowendmac.com/2009/wifi-pc-cards-for-powerbooks-running-mac-os-9/)
	- [PCMCIA Ethernet Card with MacOS 8.5 Support? : r/VintageApple](https://www.reddit.com/r/VintageApple/comments/9qnfem/comment/e8cbr9u/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)

## Software
- The MOTHERLODE! [ftp://macos.retro-os.live](ftp://macos.retro-os.live)
- [GitHub - tenox7/wrp: Web Rendering Proxy: Use vintage, historical, legacy browsers on modern web](https://github.com/tenox7/wrp)
- [Macintosh Garden - Celebrating Macintosh Abandonware!](https://macintoshgarden.org/)
- [BlueSCSI Images - BlueSCSI v2 Documentation](https://bluescsi.com/docs/BlueSCSI-Images)
- [Classic MacOS Software](http://www.synack.net/~bbraun/macapps.html)
- [E-Maculation Home](https://www.emaculation.com/home.html)
- [GitHub - CamHenlin/MessagesForMacintosh: An Apple iMessage client for classic Macintosh (System 2.0 - MacOS 9.2.2)](https://github.com/CamHenlin/MessagesForMacintosh?tab=readme-ov-file)
- [Series: C Programming on System 6 - joshua stein](https://jcs.org/system6c)
- [Ambrosia archive](http://www.ambrosiaarchive.com/)
- ftp://repo1.macintoshgarden.org
	- `macgarden` / `publicdl`
- [Mac Hut - Vintage Apple Mac Archives & Mac Abandonware](https://machut.net)
- [WinWorld: Library](https://winworldpc.com/library/operating-systems)
- [GitHub - hunterirving/macweb-2.0c-plus: the MacWeb 2.0 browser, enhanced for black and white Macs](https://github.com/hunterirving/macweb-2.0c-plus)
- [Macintosh SE/30 System 7.5.3 & 8.1 HDA image for ROM upgraded Macs \| 68kMLA](https://68kmla.org/bb/index.php?threads/macintosh-se-30-system-7-5-3-8-1-hda-image-for-rom-upgraded-macs.40522/)

## Disk formats

- SS/DD is a 400k disk
- DS/DD is an 800k disk
- According to [this page](https://siber-sonic.com/mac/newmillfloppy.html), some later floppies were marked as as SS when they were actually DS media, so that would explain why they are showing up as 800K

## Installing MacTCP and DaynaPORT on System 6 on Mac Plus

Based on [the official guide](https://bluescsi.com/docs/WiFi-DaynaPORT).

1. Install Mac TCP and MountImage by dragging them into the System folder.
2. Restart.
3. Mount the DaynaPORT disk image, ensure “allow changes to the disk image” is checked.
4. Run the DaynaPORT installer.
	1. Choose Custom
	2. Only check DaynaPORT SCSI/Link
	3. Do NOT check AppleTalk
6. Restart.
7. Set up MacTCP in Control Panel.
8. Restart.

**Important!** The Pi Pico W in the BlueSCSI does not like it when Ubiquiti access points share a single SSID.