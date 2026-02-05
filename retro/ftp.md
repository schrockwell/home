---
title: FTP servers and clients
---

# FTP servers and clients

FTP is a convenient means of transferring data for vintage computers are are online but do not support SFTP.

## FTP clients

- [Fetch](https://macintoshgarden.org/apps/fetch-212) for System 6.x - Mac OS

## Set up an FTP server

**Disclaimer**: FTP is an outdated, insecure protocol on the modern Internet. Use firewall rules to ensure the server only exposed to trusted IP addresses.

This server uses [vsftpd](https://security.appspot.com/vsftpd.html).

On Ubuntu:

```sh
sudo apt update
sudo apt install vsftpd
adduser # to make a new FTP user
```

Edit `/etc/vsftpd.conf` and change:

```conf
# Allow local users to log in
local_enable=YES

# Enable uploads
write_enable=YES

# restrict users to home directories
chroot_local_user=YES
allow_writeable_chroot=YES
```

Restart the service:

```sh
sudo systemctl restart vsftp
```

Finally, open port 21 _to trusted IP address_ on the firewall.