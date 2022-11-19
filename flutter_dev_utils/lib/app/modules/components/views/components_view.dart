/*
 * @Date: 2022-11-19
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dev_utils/widgets/list_widget.dart';

import 'package:get/get.dart';

import '../controllers/components_controller.dart';

class ComponentsView extends GetView<ComponentsController> {
  const ComponentsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    Color themeColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xffF3F4F6),
      body: Column(
        children: [
          /**
          * 顶部安全区域样式设置
          * TODO: 文章输出，总结app安全区域的处理方案
          */
          AnnotatedRegion<SystemUiOverlayStyle>(
              child: Container(
                color: Colors.white,
                height: context.mediaQueryPadding.top,
              ),
              value: appBarTheme.systemOverlayStyle!),
          Container(
            height: 49,
            color: Colors.white,
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              // indicator: RoundRectTabIndicator(
              //   borderSide: BorderSide(color: themeColor, width: 3),
              // ),
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              labelColor: themeColor,
              indicatorWeight: 3,
              unselectedLabelColor: Colors.grey,
              indicatorColor: themeColor,
              controller: controller.tabController,
              tabs: controller.tabData.map((name) => Tab(text: name)).toList(),
            ),
          ),
          Expanded(
              child: TabBarView(
            controller: controller.tabController,
            children: controller.tabData.map((name) {
              return ListWidget(tabName: name);
            }).toList(),
          ))
        ],
      ),
    );
  }
}
