import { defaultTheme } from '@vuepress/theme-default'
import { defineUserConfig } from 'vuepress/cli'
import { viteBundler } from '@vuepress/bundler-vite'

export default defineUserConfig({
  base: '/keysmet-doc',

  locales: {
    '/': {
      lang: 'en-US',
      title: 'Keysmet',
      description: 'Keysmet Programming Guide',
    },
    '/fr/': {
      lang: 'fr-FR',
      title: 'Keysmet',
      description: 'Guide de programmation Keysmet',
    },
  },

  theme: defaultTheme({
    logo: null,

    locales: {
      '/': {
        selectLanguageName: 'English',
        navbar: [
          {
            text: 'Home',
            link: '/',
          },
          {
            text: 'Discord',
            link: 'https://discord.gg/kYZQket7BS',
          },
          {
            text: 'keysmet.io',
            link: 'https://keysmet.io/',
          },
        ],
        sidebar: [
          {
            text: 'Guide',
            children: [
              '/README.md',
              '/lua-tips.md',
            ],
          },
          {
            text: 'API Reference',
            children: [
              '/api.md',
              '/motion.md',
              '/synth.md',
            ],
          },
        ],
        editLinkText: 'Edit this page on GitHub',
        lastUpdatedText: 'Last Updated',
        contributorsText: 'Contributors',
      },
      '/fr/': {
        selectLanguageName: 'Français',
        navbar: [
          {
            text: 'Accueil',
            link: '/fr/',
          },
          {
            text: 'Discord',
            link: 'https://discord.gg/kYZQket7BS',
          },
          {
            text: 'keysmet.io',
            link: 'https://keysmet.io',
          },
        ],
        sidebar: [
          {
            text: 'Guide',
            children: [
              '/fr/README.md',
              '/fr/lua-tips.md',
            ],
          },
          {
            text: 'Référence API',
            children: [
              '/fr/api.md',
              '/fr/motion.md',
              '/fr/synth.md',
            ],
          },
        ],
        editLinkText: 'Éditer cette page sur GitHub',
        lastUpdatedText: 'Dernière mise à jour',
        contributorsText: 'Contributeurs',
      },
    },

    repo: 'keysmet/keysmet-doc',
    editLink: true,
    lastUpdated: true,
    contributors: true,
  }),

  bundler: viteBundler(),
})
