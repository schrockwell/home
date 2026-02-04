# --- Build ---
FROM ruby:3.4-slim AS build

RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential imagemagick && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /site
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs=4
COPY . .
RUN _bin/build-images && bundle exec jekyll build

# --- Serve ---
FROM lipanski/docker-static-website:latest
COPY --from=build /site/_site/ .
EXPOSE 3000