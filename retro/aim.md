---
title: Modern AIM & ICQ
toc: true
hero:
    src: retro/aim.png
    alt: AIM client running on macOS
---

## Server setup

[retro-aim-server](https://github.com/mk6i/retro-aim-server) - [Installation instructions](https://github.com/mk6i/retro-aim-server/blob/main/docs/LINUX.md)

1. Set up DNS
2. Configure `settings.env`
	1. Set `API_HOST` and `OSCAR_HOST` to hostname
3. Open TCP ports 5190-5197 in firewall

### Creating systemd service

As root:

```bash
$ vim /etc/systemd/system/retro_aim_server.service # contents below!
$ systemctl daemon-reload
$ systemctl enable retro_aim_server.service
$ systemctl start retro_aim_server.service

# Verify it's running
$ systemctl status retro_aim_server.service

# Logs (-f to follow)
$ journalctl -u retro_aim_server.service
```

Contents of `/etc/systemd/system/retro_aim_server.service`:
```systemd
[Unit]
Description=Retro AIM Server
After=network.target

[Service]
ExecStart=/root/retro_aim_server/retro_aim_server
WorkingDirectory=/root/retro_aim_server
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```




## AIM client

[AIM client for macOS](https://github.com/mk6i/aim-for-macos) - version 5.9 is the latest and greatest

## ICQ client

[ICQ client for macOS](https://github.com/mk6i/retro-aim-server/blob/main/docs/CLIENT_ICQ.md#macos-intel--apple-silicon) - version 2000b supported

[CrossOver](https://www.codeweavers.com/crossover) works great, following those directions (unsurprising - it is Wine under the hood, after all)
