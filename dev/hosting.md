---
title: How I deploy web applications
toc: true
---

I have a lot of solo side-projects. Many of them are web apps with very modest resource requirements. Managing their deployments isn't fun. And it's easy to forget how to do them in the months (or years) between releases.

So here's my simple, standardized, reproducible, inexpensive playbook for easy deployments.

---

## Hosting

I use [DigitalOcean](https://m.do.co/c/93be971f59d7). Linode could work too.

- **VM**: one [DigitalOcean](https://m.do.co/c/93be971f59d7) Droplet
  - 2 GB RAM / 50 GB disk ($12/mo + $3/mo for backups)
- **Database**: SQLite (free)
- **Storage**: [DigitalOcean](https://m.do.co/c/93be971f59d7) Spaces Object Storage ($5/mo)
- **Domains and DNS**: [Hover](https://hover.com/7SJP3hBt) and [DigitalOcean](https://m.do.co/c/93be971f59d7)

---

## Secrets

Secret environment variables like API keys are manged by [SSE](https://github.com/schrockwell/sse), a tool I wrote to fulfill this exact need.

### In Development

[direnv](https://direnv.net/) automatically loads the secrets into the shell.

```sh
# --- .envrc ---

#! /bin/bash
eval "$(sse load)"
```

### In Production

The `sse` binary is included in the production Docker image. The entrypoint script loads the variables before starting the server.

```sh
# --- bin/entrypoint ---

#! /bin/bash
eval "$(sse load production)"
exec "$@"
```

---

## Kamal

[Kamal](https://kamal-deploy.org/) is the secret sauce for effortless deploys. There are a few conventions to follow to keep it painless for hosting many small projects on a single host.

### Define a wildcard DNS entry

Add an `A` record for `*.example.com` directly to your VM.

Any new apps deployed the hostname `[appname].example.com` will "just work" with TLS when you deploy them for the first time, since Let's Encrypt will be able to find the server without waiting for DNS to propagate. Once you confirm the deploy works, the hostname can be changed to its final value.

### Build x64 images locally 

Even on ARM devices like Apple Silicon, you can still build x64 images locally via `buildx`. Don't try to run builds on your deployment box, since they can be resource-intensive and cause downtime for your live apps.

```yml
builder:
  arch: amd64
  ```

### Use the local image registry

Kamal now ships with an image registry that runs right on your local machine's Docker daemon. You don't need to pay (or manage credentials) for a hosted solution. Just use the really powerful computer that's right in your lap – it's free.

```yaml
registry:
  server: localhost:5555
```

---

## SQLite

SQLite is great for little self-hosted projects. And it's free!

Create directories on the host OS like `/var/lib/kamal/myapp/data` and mount them as volumes.

```yaml
# --- config/deploy.yml ---

volumes:
  -/var/lib/kamal/myapp/data:/app/data
```

And in the app simply point SQLite to `/app/data/myapp_prod.db`.

### File Permissions

To ensure the mounted directories have the correct permissions to be accessed by the container, `chown nobody:nogroup` on the host OS, and specify `USER nobody` in the Dockerfile.

### Web Interface

To temporarily start a web-based web management UI for SQLite, here's a shell script to spin up `sqlite-web` in Docker on port 8080 (open the port only to your IP).

```sh
# --- /var/lib/kamal/sqlite-web.sh ---

#! /bin/bash

DATABASE_PATHS=$(find . -type f \( -iname "*.sqlite" -o -iname "*.db" \) -printf '%P ')

echo "Started sqlite-web at http://example.com:8080/"

docker run -it --rm \
        -p 8080:8080 \
        -v /var/lib/kamal:/data \
        ghcr.io/coleifer/sqlite-web:latest \
        $DATABASE_PATHS
```

---

## Miscellaneous

On macOS, use [OrbStack](https://orbstack.dev/) instead of Docker Desktop. It's way nicer, and also supports VMs.

Some Elixir dependencies have trouble in a cross-compiling environment. Here's the fix, applied during the build phase:

```Dockerfile
# --- Dockerfile ---

# Disable BEAM JIT to avoid QEMU emulation bugs during cross-compilation
ENV ERL_FLAGS="+JPperf true"
```

---

## Getting Started

// TODO: Write out full instructions for installing Kamal, setting up SSH, doing the first deploy, etc.

---

## Example: Static Jekyll site

The amazing [lipanski/docker-static-website](https://github.com/lipanski/docker-static-website) image is perfect for serving up static content. It uses [BusyBox](https://busybox.net/) httpd and is only 80 KB!

```Dockerfile
# --- Dockerfile ---

# --- Production stage ---
FROM ruby:3.3.5-alpine AS builder

RUN apk add --no-cache build-base

WORKDIR /site

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
RUN bundle exec jekyll build

# --- Production stage ---
FROM lipanski/docker-static-website:latest

COPY --from=builder /site/_site/ .
```

Kamal config:

```yaml
# --- config/deploy.yml ---

service: myapp

image: myname/myapp

servers:
  web:
    - kamal.example.com

proxy:
  ssl: true
  host: myapp.example.com
  app_port: 3000
  healthcheck:
    path: /

registry:
  server: localhost:5555

builder:
  arch: amd64
```

Jekyll config:

```yaml
# --- _config.yml ---
exclude:
  - config/deploy.yml
```