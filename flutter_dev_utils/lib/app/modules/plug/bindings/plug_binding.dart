import 'package:get/get.dart';

import '../controllers/plug_controller.dart';

class PlugBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlugController>(
      () => PlugController(),
    );
  }
}
