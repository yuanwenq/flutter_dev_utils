/*
 * @Date: 2022-11-17
 * @Desc: 首页导航
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: _buildView(),
      bottomNavigationBar: _buildBottomNavigation(),
    );
  }

  _buildBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: controller.currentIndex.value,
      onTap: (index) => controller.changeBottomNavigationIndex(index),
      // backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: controller.defaultColor,
      selectedItemColor: controller.activeColor,
      items: [
        _buildBottomItem('组件', Icons.build, 0),
        _buildBottomItem('插件', Icons.drag_indicator, 1),
        _buildBottomItem('业务', Icons.business_center, 2),
        _buildBottomItem('设置', Icons.app_settings_alt, 3),
      ],
    );
  }

  _buildBottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: controller.defaultColor,
        ),
        activeIcon: Icon(icon, color: controller.activeColor),
        label: title);
  }

  Widget _buildView() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: controller.pageList,
    );
  }
}
