# Keysmet Documentation

This repository contains the VuePress-powered documentation site for Keysmet.

## Development

Install dependencies:

```bash
npm install
```

Start the development server:

```bash
npm run docs:dev
```

The site will be available at `http://localhost:8080`.

## Build

Build the static site:

```bash
npm run docs:build
```

The built files will be in `docs/.vuepress/dist`.

## GitHub Pages Deployment

This site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch.

### Setup Instructions

1. Go to your repository settings on GitHub
2. Navigate to **Settings > Pages**
3. Under **Build and deployment**, set:
   - **Source**: GitHub Actions
4. Push changes to the `main` branch to trigger deployment

The site will be available at: `https://keysmet.github.io/keysmet-doc/`

## Multi-Language Support

The documentation is available in multiple languages:
- English (default): `/`
- French: `/fr/`

To add more languages, update the `locales` configuration in [docs/.vuepress/config.js](docs/.vuepress/config.js) and create the corresponding documentation files in the new language directory.

## Documentation

Visit the documentation at [https://keysmet.github.io/keysmet-doc/](https://keysmet.github.io/keysmet-doc/)

Available languages:
- [English](https://keysmet.github.io/keysmet-doc/)
- [Français](https://keysmet.github.io/keysmet-doc/fr/)

Join the [Discord server](https://discord.gg/kYZQket7BS) for community support and sharing.
