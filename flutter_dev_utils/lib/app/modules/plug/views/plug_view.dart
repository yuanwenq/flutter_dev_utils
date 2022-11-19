/*
 * @Date: 2022-11-19
 * @Desc: 
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/plug_controller.dart';

class PlugView extends GetView<PlugController> {
  const PlugView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PlugView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PlugView is working ${controller.count}',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
