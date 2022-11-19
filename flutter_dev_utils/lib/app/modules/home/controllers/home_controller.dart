/*
 * @Date: 2022-11-17
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_dev_utils/app/modules/business/views/business_view.dart';
import 'package:flutter_dev_utils/app/modules/components/views/components_view.dart';
import 'package:flutter_dev_utils/app/modules/plug/views/plug_view.dart';
import 'package:flutter_dev_utils/app/modules/set/views/set_view.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  final defaultColor = Colors.grey;
  final activeColor = Colors.blue;
  final List<Widget> pageList = [
    ComponentsView(),
    PlugView(),
    BusinessView(),
    SetView()
  ];
  final PageController pageController = PageController(initialPage: 0);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeBottomNavigationIndex(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
