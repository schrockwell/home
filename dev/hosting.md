---
title: How I deploy web applications
toc: true
---

I have a lot of solo side-projects. Many of them are web apps with very modest resource requirements. Managing their deployments isn't fun. And it's easy to forget how to do them in the months (or years) between releases.

So here's my simple, standardized, reproducible, inexpensive playbook for easy deployments.

---

## Hosting

Nearly everything is on [DigitalOcean](https://m.do.co/c/93be971f59d7).

- **VM**: one [DigitalOcean](https://m.do.co/c/93be971f59d7) Droplet
  - 2 GB RAM / 50 GB disk ($12/mo + $3/mo for backups)
- **Database**: [DigitalOcean](https://m.do.co/c/93be971f59d7) managed Postgres
  - 1 GB RAM / 1vCPU / 10 GB disk ($15/mo)
- **Storage**: [DigitalOcean](https://m.do.co/c/93be971f59d7) Spaces Object Storage ($5/mo)
- **Domains and DNS**: [Hover](https://hover.com/7SJP3hBt) and [DigitalOcean](https://m.do.co/c/93be971f59d7)

---

## Secrets

Secret environment variables like API keys are manged by [SSE](https://github.com/schrockwell/sse), a tool I wrote to fulfill this exact need.

In **development**, [direnv](https://direnv.net/) automatically loads the secrets into the shell.

*.envrc*

```sh
#! /bin/bash
eval "$(sse load)"
```

In **production**, the `sse` binary is included in the production Docker image. The entrypoint script loads the variables before starting the server.

*bin/entrypoint*

```sh
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

## Miscellaneous

On macOS, use [OrbStack](https://orbstack.dev/) instead of Docker Desktop. It's way nicer, and also supports VMs.

---

## Getting Started

// TODO: Write out full instructions for installing Kamal, setting up SSH, doing the first deploy, etc.

---

## Example: Static Jekyll site

The amazing [lipanski/docker-static-website](https://github.com/lipanski/docker-static-website) image is perfect for serving up static content. It uses [BusyBox](https://busybox.net/) httpd and is only 80 KB!

*Dockerfile*
```Dockerfile
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

*config/deploy.yml* (Kamal config)

```yaml
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

*_config.yml* (Jekyll config)

```yaml
exclude:
  - config/deploy.yml
```