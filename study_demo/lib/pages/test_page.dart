/*
 * @Date: 2023-03-06
 * @Desc: 
 */
import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("test_page"),
      ),
      body: Container(
        color: Colors.pink,
        child: const Text("test_page"),
      ),
    );
  }
}
