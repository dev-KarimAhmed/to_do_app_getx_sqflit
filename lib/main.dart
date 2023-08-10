import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:to_do_app_getx_sqflit/ui/pages/notification_screen.dart';

import 'ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      home: NotificationScreen(pyload:'title | Description | 10:22 Am'),
    );
  }
}
