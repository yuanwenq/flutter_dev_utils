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
    author: "",
    subSidebar: 'auto',
    search: true,
    searchMaxSuggestions: 10,
    // 右上角导航
    nav: [
      { text: 'Home', link: '/', icon: 'reco-home' },
    ],
    sidebar: [
      {
        title: "介绍",
        path: "/",
        icon: 'reco-home',
        collapsable: false,
        children: [
          {
            title: "起步",
            path: "/start/"
          }
        ]
      },
      {
        title: '书籍笔记',
        path: '/book/',
        collapsable: false,
        children: [
          { 
            title: "Flutter 语言基础", 
            path: "/book/language_base",
            collapsable: false,
          },
        ]
      },
      {
        title: '1.组件集',
        path: '/components/',
        collapsable: false,
        children: [
          {
            title: "Image",
            path: "/components/image_use"
          },
        ]
      },
      {
        title: '2.业务操作',
        path: '/business/',
        collapsable: false,
        children: [
          { 
            title: "布局", 
            path: "/business/layout/",
            collapsable: false,
            children: [
              {
                title: "区域布局",
                path: "/business/layout/area"
              },
              {
                title: "页面布局",
                path: "/business/layout/page_layout"
              },
              {
                title: "底部导航栏各种实现方式",
                path: "/business/layout/lottie_bottomNavigation"
              }
            ]
          },
          {
            title: "功能", 
            path: "/business/function/",
            collapsable: false,
            children: [
              {
                title: "轮播图实现",
                path: "/business/function/swiper_image"
              },
              {
                title: "视频播放实现",
                path: "/business/function/video_controller"
              },
              {
                title: "短视频播放实现",
                path: "/business/function/short_video"
              },
            ]
          },
          {
            title: "交互", 
            path: "/business/interact/",
            collapsable: false,
            children: [
              {
                title: "弹窗实现",
                path: "/business/interact/full_screen_popup"
              },
            ]
          },
          {
            title: "数据", 
            path: "/business/data/",
            collapsable: false,
            children: [
              {
                title: "String类型使用手册",
                path: "/business/data/string"
              },
              {
                title: "List类型使用手册",
                path: "/business/data/list"
              },
              {
                title: "Class类型使用手册",
                path: "/business/data/class"
              },
            ]
          },
          {
            title: "网络", 
            path: "/business/network/",
            collapsable: false,
            children: [
              {
                title: "网络请求数据使用手册",
                path: "/business/network/network"
              },
            ]
          }
        ]
      },
      {
        title: '第三章: 插件',
        path: '/plug/',
        collapsable: false,
        children: [
          {
            title: "插件总览",
            path: "/plug/all"
          }
        ]
      },
      {
        title: '第四章: 原理',
        path: '/principle/',
        collapsable: false,
        children: [
          {
            title: "APP生命周期",
            path: "/principle/app_life"
          }
        ]
      },
      {
        title: '第五章: 测试',
        path: '/test/',
        collapsable: false,
        children: [
          {
            title: "iOS 调试与部署",
            path: "/test/ios_test"
          }
        ]
      },
      {
        title: '第六章: 优化',
        path: '/optimization/',
        collapsable: false,
        children: [
          {
            title: "占位",
            path: "/question/zw"
          }
        ]
      },
      {
        title: '第七章: 部署',
        path: '/deploy/',
        collapsable: false,
        children: [
          {
            title: "占位",
            path: "/question/zw"
          }
        ]
      },
      {
        title: '第八章: 其他',
        path: '/question/',
        collapsable: false,
        children: [
          {
            title: "占位",
            path: "/question/zw"
          }
        ]
      },
      {
        title: '第九章: 项目方案',
        path: '/project/',
        collapsable: false,
        children: [
          {
            title: "占位",
            path: "/project/zw"
          }
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
  },
  plugins: ['fulltext-search'],
  // configureWebpack: {
  //   resolve: {
  //     alias: {
  //       '@images': '/docs/.vuepress/public/images/'
  //     }
  //   }
  // }
}