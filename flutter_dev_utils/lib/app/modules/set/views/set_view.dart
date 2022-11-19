import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/set_controller.dart';

class SetView extends GetView<SetController> {
  const SetView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SetView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'SetView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
