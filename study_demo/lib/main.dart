/*
 * @Date: 2023-03-06
 * @Desc: 
 */
import 'dart:io';

import 'package:flutter/material.dart';

import 'pages/pages.dart';

void main() {
  print(Directory.current.path);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Study Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Study Demo"),
      ),
      body: Wrap(
        children: _buildRouterButton(context),
      ),
    );
  }

  List<Widget> _buildRouterButton(BuildContext context) {
    List<Map<String, dynamic>> routerList = [
      {"text": "test", "widget": const TestPage()},
      {"text": "异步任务", "widget": const AsyncTaskPage()},
      {"text": "Stream红绿灯", "widget": const StreamPage()},
      {"text": "test1", "widget": const TestPage()},
      {"text": "test1", "widget": const TestPage()},
      {"text": "test1", "widget": const TestPage()},
      {"text": "test1", "widget": const TestPage()},
      {"text": "test1", "widget": const TestPage()},
      {"text": "test1", "widget": const TestPage()},
    ];
    List<Widget> result = [];
    for (var i = 0; i < routerList.length; i++) {
      result.add(TextButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return routerList[i]["widget"];
            }));
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.black38),
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Text(
              routerList[i]["text"],
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          )));
    }
    return result;
  }
}
