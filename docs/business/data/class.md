---
title: "Class类型使用手册"
---

## 构造函数后的冒号

构造函数后的冒号作用为: <span class="code-block-bg">初始化列表和参数娇艳</span>

:warning: 需要注意以下几点：

1. 不同于构造函数内部，这里不能使用`this`;
2. 这里的初始化可以是多个语句，多个语句之间使用逗号`,`分隔;
3. 这里可以调用父类构造函数,super();
4. 这里是为`final`字段赋值;
5. 可以使用`assert`检查参数;

``` dart
final String x;
final String y;
 
Point.fromJson(Map<String, num> json) : x = json['x'], y = json['y'] {
    print('In Point.fromJson(): ($x, $y)');
}
```