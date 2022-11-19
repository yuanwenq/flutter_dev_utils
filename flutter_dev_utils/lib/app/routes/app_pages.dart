import 'package:get/get.dart';

import '../modules/business/bindings/business_binding.dart';
import '../modules/business/views/business_view.dart';
import '../modules/components/bindings/components_binding.dart';
import '../modules/components/views/components_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/plug/bindings/plug_binding.dart';
import '../modules/plug/views/plug_view.dart';
import '../modules/set/bindings/set_binding.dart';
import '../modules/set/views/set_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.COMPONENTS,
      page: () => const ComponentsView(),
      binding: ComponentsBinding(),
    ),
    GetPage(
      name: _Paths.PLUG,
      page: () => const PlugView(),
      binding: PlugBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS,
      page: () => const BusinessView(),
      binding: BusinessBinding(),
    ),
    GetPage(
      name: _Paths.SET,
      page: () => const SetView(),
      binding: SetBinding(),
    ),
  ];
}
