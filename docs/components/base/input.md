---
title: "输入框及表单"
---

## TextField 垂直居中

```dart
border: InputBorder.none // 这种方式不会垂直居中

border: OutlineInputBorder(borderSide: BorderSide.none) // 这种可以

TextField(
  ...
  decoration: InputDecoration(
    ...
    border: const OutlineInputBorder(borderSide: BorderSide.none)
  ),
)
```

## 隐藏输入框的方式

第一种:通过上下文获取子组件的焦点，然后进行关闭
``` dart
body: GestureDetector(
  onTap: () {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus &&
        currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus.unfocus();
    }
  },
  child: child,
),
```

第二种:系统级别

这种方式虽然能隐藏输入框,但是输入框还没有失去焦点
``` dart
SystemChannels.textInput.invokeMethod('TextInput.hide');
```

## 参考

- [《Flutter实战·第二版》 3.5 输入框及表单](https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield)
- [flutter textField](https://juejin.cn/post/7080089347042574349)