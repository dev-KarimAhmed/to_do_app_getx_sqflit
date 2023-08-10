import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:to_do_app_getx_sqflit/ui/pages/notification_screen.dart';
import 'package:to_do_app_getx_sqflit/ui/theme.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeMode.light,
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(pyload: 'Title | Description | 10:22 Am'),
    );
  }
}
