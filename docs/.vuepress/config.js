import { defaultTheme } from '@vuepress/theme-default'
import { defineUserConfig } from 'vuepress/cli'
import { viteBundler } from '@vuepress/bundler-vite'

export default defineUserConfig({
  lang: 'en-US',
  title: 'Keysmet',
  description: 'Keysmet Programming Guide',

  base: '/',

  theme: defaultTheme({
    logo: null,

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
        link: 'https://keysmet.io/script',
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

    repo: 'keysmet/keysmet-doc',
    editLink: true,
    editLinkText: 'Edit this page on GitHub',
    lastUpdated: true,
    lastUpdatedText: 'Last Updated',
    contributors: true,
    contributorsText: 'Contributors',
  }),

  bundler: viteBundler(),
})
