/*
 * @Date: 2022-11-17
 * @Desc: 配置文件的入口文件，也可以是 YML 或 toml
 */
module.exports = {
  base: "/flutter_dev_utils/",
  title: "Flutter开发手册",
  description: "Just playing around",
  theme: 'reco',
  themeConfig: {
    author: "干将",
    subSidebar: 'auto',
    // 右上角导航
    nav: [
      { text: 'Home', link: '/', icon: 'reco-home' },
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
        title: "介绍",
        path: "/",
        icon: 'reco-home'
      },
      {
        title: '第一章: 业务',
        path: '/business/',
        collapsable: false,
        children: [
          { 
            title: "布局", 
            path: "/business/layout/",
            collapsable: true,
            children: [
              {
                title: "区域布局",
                path: "/business/layout/area"
              },
              {
                title: "页面布局",
                path: "/business/layout/page_layout"
              }
            ]
          },
          {
            title: "功能", 
            path: "/business/function/",
            collapsable: true,
            children: [
              {
                title: "占位1",
                path: "/business/function/zw"
              },
              {
                title: "占位2",
                path: "/business/function/zwc"
              },
            ]
          }
        ]
      },
      {
        title: '第二章: 组件',
        path: '/components/',
        collapsable: false,
        children: [
          { 
            title: "基础", 
            path: "/components/base/", 
            collapsable: true,
            children: [
              {
                title: "文本家族及样式",
                path: "/components/base/文本家族及样式"
              }
            ] 
          },
        ]
      },
      {
        title: '第三章: 插件',
        path: '/plug/',
        collapsable: false,
        children: [
          '/'
        ]
      },
      {
        title: '第四章: 原理',
        path: '/principle/',
        collapsable: false,
        children: [
          '/'
        ]
      },
      {
        title: '第五章: 问题',
        path: '/question/',
        collapsable: false,
        children: [
          '/'
        ]
      },
    ],
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