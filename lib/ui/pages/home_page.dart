import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_getx_sqflit/services/theme_services.dart';

import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchMode();
            Get.to(NotificationScreen(pyload: 'Title | Description | 10:22 Am'));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(),
    );
  }
}
