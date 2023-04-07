/*
 * @Date: 2022-11-17
 * @Desc: 配置文件的入口文件，也可以是 YML 或 toml
 */
module.exports = {
  base: '/flutter_dev_utils/',
  title: 'Flutter开发手册',
  description: 'Just playing around',
  theme: 'reco',
  themeConfig: {
    author: '',
    subSidebar: 'auto',
    search: true,
    searchMaxSuggestions: 10,
    // 右上角导航
    nav: [{ text: 'Home', link: '/', icon: 'reco-home' }],
    sidebar: [
      {
        title: '介绍',
        icon: 'reco-home',
        collapsable: false,
        children: [
          {
            title: '起步',
            path: '/start/',
          },
        ],
      },
      {
        title: '书籍笔记',
        path: '/book/',
        collapsable: false,
        children: [
          {
            title: '1.语言基础',
            path: '/book/language_base',
            collapsable: false,
          },
        ],
      },
      {
        title: '组件集',
        collapsable: false,
        children: [
          {
            title: 'Image',
            path: '/components/image_use',
          },
        ],
      },
      {
        title: '业务操作',
        collapsable: false,
        children: [],
      },
      {
        title: '项目总结',
        path: '/project/',
        collapsable: false,
        children: [
          {
            title: 'macOS文件上传工具',
            path: '/project/macos_file_upload_desktop/',
          },
        ],
      },
    ],
  },
  markdown: {
    lineNumbers: true,
    plugins: ['task-lists'],
  },
  plugins: ['fulltext-search'],
};
