import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_getx_sqflit/services/theme_services.dart';

import '../size_config.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'notification_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchMode();
            Get.to(
                NotificationScreen(pyload: 'Title | Description | 10:22 Am'));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              label: 'Add Task',
              onTap: () {},
            ),
            InputField(hint: 'Add Task', title: 'title'),
          ],
        ),
      ),
    );
  }
}
