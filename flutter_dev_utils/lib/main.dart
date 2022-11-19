/*
 * @Date: 2022-11-17
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_dev_utils/res/app_theme.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: "Application",
    defaultTransition: Transition.cupertino,
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
    themeMode: ThemeMode.light,
    darkTheme: AppTheme.darkTheme(),
    theme: AppTheme.lightTheme(),
  ));
}
