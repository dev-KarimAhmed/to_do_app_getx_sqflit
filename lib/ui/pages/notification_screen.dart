import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key, required this.pyload}) : super(key: key);
  final String pyload;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _pyload = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pyload = widget.pyload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          _pyload.toString().split('|')[0],
          style: TextStyle(
              color: Get.isDarkMode ? Colors.white : darkGreyClr,
              fontSize: 26,
              fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
        backgroundColor: context.theme.primaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Hello, Karim',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
                fontSize: 26,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have a new reminder',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.grey[100] : darkGreyClr,
                fontSize: 18,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
