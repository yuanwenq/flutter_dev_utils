import 'package:get/get.dart';

import '../controllers/set_controller.dart';

class SetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetController>(
      () => SetController(),
    );
  }
}
