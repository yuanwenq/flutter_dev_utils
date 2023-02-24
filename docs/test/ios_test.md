---
title: "iOS 调试与部署"
---

## 调试

- [Flutter iOS 真机测试 -- 值得收藏](https://juejin.cn/post/7112590163884113934)

### vscode 真机运行 无法打开“iproxy”,因为无法验证开发者。

```sh
# /Users/mac/flutter 为flutter安装目录，替换为自身的就可以
sudo xattr -d com.apple.quarantine /Users/mac/flutter/bin/cache/artifacts/usbmuxd/iproxy
```

## 参考

- [Flutter iOS 真机测试 -- 值得收藏](https://juejin.cn/post/7112590163884113934)
- [Flutter iOS真机调试及打包过程记录](https://www.jianshu.com/p/58a6e272a038)