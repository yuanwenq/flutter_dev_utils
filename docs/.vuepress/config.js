/*
 * @Date: 2022-11-17
 * @Desc: 配置文件的入口文件，也可以是 YML 或 toml
 */
module.exports = {
  base: "/flutter_dev_utils/",
  title: "flutter开发工具",
  description: "Just playing around",
  themeConfig: {
    // 右上角导航
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Guide', link: '/guide/' },
      { text: 'External', link: 'https://google.com' },
      {
        text: 'Languages',
        ariaLabel: 'Language Menu',
        items: [
          { text: 'Chinese', link: '/language/chinese/' },
          { text: 'Japanese', link: '/language/japanese/' }
        ]
      }
    ],
    sidebar: [
      {
        title: 'vuepress测试',
        path: '/guide/',
        collapsable: false,
        sidebarDepth: 1,    // 可选的, 默认值是 1
        children: [
          '/',
        ]
      },
    ]
  },
  markdown: {
    // markdown-it-anchor 的选项
    anchor: { permalink: false },
    // markdown-it-toc 的选项
    toc: { includeLevel: [1, 2] },
    extendMarkdown: md => {
      // 使用更多的 markdown-it 插件!
      // md.use(require('markdown-it-xxx'))
    }
  }
  // configureWebpack: {
  //   resolve: {
  //     alias: {
  //       '@images': '/docs/.vuepress/public/images/'
  //     }
  //   }
  // }
}