/*
 * @Date: 2022-11-17
 * @Desc: 
 */
import 'package:get/get.dart';
import '../../controller_location.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ComponentsController>(
      () => ComponentsController(),
    );
    Get.lazyPut<PlugController>(
      () => PlugController(),
    );
    Get.lazyPut<BusinessController>(
      () => BusinessController(),
    );
    Get.lazyPut<SetController>(
      () => SetController(),
    );
  }
}
