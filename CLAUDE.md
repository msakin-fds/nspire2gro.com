# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@../CLAUDE.md

## Site Overview

**Nspire2Gro** — "Unlock Success and Skyrocket Growth with Nspire2Gro."
- **Live URL**: https://www.nspire2gro.com (bare domain redirects to www)
- **Admin URL**: https://www.nspire2gro.com/wp-admin
- **Theme**: Divi 4.27.6 (Elegant Themes) — page builder, no FSE/block theme
- **Timezone offset**: GMT-4

## WordPress Connection

Credentials are in `.env` (gitignored). Copy `.env.example` to `.env` to set up.

```bash
source .env
# Then use $WP_SITE_URL, $WP_USER, $WP_APP_PASSWORD in curl calls
```

**REST API base**: `https://www.nspire2gro.com/wp-json/wp/v2/`

Quick helper:
```bash
./wp.sh /wp/v2/pages               # list pages
./wp.sh /wp/v2/posts/123           # get single post
./wp.sh /wp/v2/posts/123 PATCH '{"title":{"raw":"New Title"}}'
```

Direct curl pattern:
```bash
curl -s -u "$WP_USER:$WP_APP_PASSWORD" \
  "https://www.nspire2gro.com/wp-json/wp/v2/<endpoint>"
```

## Active Plugins

| Plugin | Purpose |
|---|---|
| Divi Modules Pro | Extended Divi builder modules |
| Divi Plus | Additional Divi modules/effects |
| GTM4WP | Google Tag Manager integration |
| Ninja Forms | Contact/lead capture forms |
| Redirection | 301/302 redirect management |
| WPCode Lite | Header/footer code injection |
| Yoast Duplicate Post | Page/post cloning |
| Yoast SEO | SEO meta, sitemaps, schema |

## Content Architecture

- **Homepage**: Static page (page ID 2253), built with Divi
- **Blog**: Not set as static page (`page_for_posts: 0`) — standard `/blog` or disabled
- All layout/design work is done inside the **Divi Builder** (visual editor or JSON import), not via PHP templates

## Key API Endpoints

```
GET  /wp/v2/pages?per_page=100          # all pages
GET  /wp/v2/posts?per_page=100          # all posts
GET  /wp/v2/media?per_page=100          # media library
GET  /yoast/v1/meta                     # Yoast SEO meta
GET  /divi/v1/                          # Divi-specific endpoints
POST /wp/v2/posts                       # create post
PATCH /wp/v2/posts/{id}                 # update post
```

## GitHub

**Repo**: https://github.com/msakin-fds/nspire2gro.com
**Remote**: `origin` → `https://github.com/msakin-fds/nspire2gro.com.git`
**Default branch**: `main`
