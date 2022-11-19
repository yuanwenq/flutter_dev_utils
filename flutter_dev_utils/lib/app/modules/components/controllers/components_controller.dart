/*
 * @Date: 2022-11-19
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComponentsController extends GetxController
    with GetTickerProviderStateMixin {
  final List<String> tabData = [
    '基础',
    '容器',
    '布局',
    '滚动',
    '功能',
    '事件',
    '通知',
    '自定义',
  ];

  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabData.length, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
