---
title: Access HFS floppies with hfsutils
---

[hfsutils manpage](https://manpages.debian.org/jessie/hfsutils/index.html) :: [OS X Daily article](https://osxdaily.com/2024/02/27/how-to-mount-copy-hfs-classic-mac-drives-on-macos/)

This is a slightly-janky way to copy files to and from HFS-formatted floppies created on System 6 or 7, but it works on modern macOS with a [USB floppy drive](https://amzn.to/4rX7GUc) and 1.44 MB disks.

---

## Setup

Install `hfsutils` via Homebrew.

```bash
brew install hfsutils
```

You need to be root to do anything else, so run `sudo -s` to get a root shell.

The utilities try to be smart about where the files are located, so prefix all disk paths with `:` to ensure it looks at the floppy drive instead of the local filesystem.

## Usage

Use `diskutil list` to find the floppy drive's device name `/dev/diskN`.

```plaintext
$ diskutil list
[...]
/dev/disk14 (external, physical):
   #:                       TYPE NAME                    SIZE       IDENTIFIER
   0:                                                   *1.5 MB     disk14
```

Mount the disk and do copy operations.

```sh
hmount /dev/diskN # mount the floppy drive

hls # get a list of files

hcopy :diskfile ~/localfile # copy FROM floppy
hcopy ~/localfile :diskfile # copy TO floppy

humount # unmount the floppy drive
```

Copying *to* disk will result in files that do not have the correct creator and type codes, so they won't be recognized by the classic Mac. Use `hattrib` to set the correct attributes.

```sh
hattrib -c 'ttxt' -t 'TEXT' :diskfile # SimpleText
```

## All commands

- [hattrib](https://manpages.debian.org/jessie/hfsutils/hattrib.1.en.html)
- [hcd](https://manpages.debian.org/jessie/hfsutils/hcd.1.en.html)
- [hcopy](https://manpages.debian.org/jessie/hfsutils/hcopy.1.en.html)
- [hdel](https://manpages.debian.org/jessie/hfsutils/hdel.1.en.html)
- [hdir](https://manpages.debian.org/jessie/hfsutils/hdir.1.en.html)
- [hformat](https://manpages.debian.org/jessie/hfsutils/hformat.1.en.html)
- [hfsutils](https://manpages.debian.org/jessie/hfsutils/hfsutils.1.en.html)
- [hls](https://manpages.debian.org/jessie/hfsutils/hls.1.en.html)
- [hmkdir](https://manpages.debian.org/jessie/hfsutils/hmkdir.1.en.html)
- [hmount](https://manpages.debian.org/jessie/hfsutils/hmount.1.en.html)
- [hpwd](https://manpages.debian.org/jessie/hfsutils/hpwd.1.en.html)
- [hrename](https://manpages.debian.org/jessie/hfsutils/hrename.1.en.html)
- [hrmdir](https://manpages.debian.org/jessie/hfsutils/hrmdir.1.en.html)
- [humount](https://manpages.debian.org/jessie/hfsutils/humount.1.en.html)
- [hvol](https://manpages.debian.org/jessie/hfsutils/hvol.1.en.html)