/*
 * @Date: 2023-03-06
 * @Desc: 
 */
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import '../model/model.dart';
import 'package:path/path.dart' as p;

class AsyncTaskPage extends StatefulWidget {
  const AsyncTaskPage({super.key});

  @override
  State<AsyncTaskPage> createState() => _AsyncTaskPageState();
}

class _AsyncTaskPageState extends State<AsyncTaskPage> {
  @override
  void initState() {
    super.initState();
    TaskResult result = calculate();
    saveToFile(result);
    render(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("异步任务"),
      ),
    );
  }

  TaskResult calculate({int count = 10000000}) {
    int startTime = DateTime.now().millisecondsSinceEpoch;
    int result = loopAll(count);
    int cost = DateTime.now().millisecondsSinceEpoch - startTime;
    return TaskResult(cost: cost, taskName: "calculate", data: result);
  }

  int loopAll(int count) {
    int sum = 0;
    for (var i = 0; i < count; i++) {
      sum += i;
    }
    return sum;
  }

  // 只有 macOS 系统中可执行
  void saveToFile(TaskResult result) {
    String filePath = p.join(Directory.current.path, "out.json");
    File file = File(filePath);
    String content = json.encode(result);
    Future<File> futureFile = file.writeAsString(content);

    // 监听任务成功完成
    futureFile.then((File file) {
      print("写入成功:${file.path}");
    });

    // 监听任务异常结束
    futureFile.catchError((err, stack) {
      print("hello catchError:${err.runtimeType}::$err");
      print("stack at ::${stack.runtimeType}::$stack");
    });

    futureFile.whenComplete(() {
      print("========Complete========");
    });
  }

  void render(TaskResult result) {
    print("结果渲染: ${result.toJson()}");
  }
}
