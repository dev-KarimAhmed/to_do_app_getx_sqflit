import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:to_do_app_getx_sqflit/services/notification_services.dart';
import 'package:to_do_app_getx_sqflit/services/theme_services.dart';
import 'package:to_do_app_getx_sqflit/ui/pages/notification_screen.dart';
import 'package:to_do_app_getx_sqflit/ui/theme.dart';
import 'ui/pages/home_page.dart';

void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized;
  //NotifyHelper().initilaizeNotifications();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      title: 'To Do',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
