import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app_getx_sqflit/services/theme_services.dart';
import 'package:to_do_app_getx_sqflit/ui/theme.dart';

import '../size_config.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'add_task_page.dart';
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
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchMode();
          },
          icon: Icon(
            Get.isDarkMode
                ? Icons.wb_sunny_outlined
                : Icons.nightlight_round_outlined,
            color: Get.isDarkMode ? Colors.white : darkGreyClr,
          ),
        ),
        centerTitle: true,
        backgroundColor: context.theme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.jpeg'),
              radius: 18,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyButton(
              label: 'Add Task',
              onTap: () {
                Get.to(AddTaskPage());
              },
            ),
            InputField(hint: 'Add Task', title: 'title'),
          ],
        ),
      ),
    );
  }
}
