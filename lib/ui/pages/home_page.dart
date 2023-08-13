import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_getx_sqflit/services/theme_services.dart';
import 'package:to_do_app_getx_sqflit/ui/theme.dart';

import '../../controllers/task_controller.dart';
import '../../services/notification_services.dart';
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
  late NotifyHelper notifyHelper;
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initilaizeNotifications();
    notifyHelper.requestIosPermession();
  }

  DateTime _selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ThemeServices().switchMode();
            notifyHelper.displayNotifications(
                title: 'Theme Changed', body: 'body');
            notifyHelper.scheduleNotifications();
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
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              taskBar(),
              datePicker(),
              SizedBox(
                height: 6,
              ),
              Expanded(child: noTaskMsg()),
              // Expanded(
              //   child: Stack(
              //     children: [
              //       SingleChildScrollView(
              //         child: Wrap(
              //           direction: Axis.horizontal,
              //           children: [
              //             Text(
              //               'You have not any Tasks yet!\nAdd Tasks to make your day productive',
              //               style: subTitleStyle,
              //               textAlign: TextAlign.center,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ],
              //   ),
              //  Obx(
              //   () {
              //     if (TaskController().taskList.isEmpty) {
              //       return noTaskMsg();
              //     } else {
              //       return Container();
              //     }
              //   },
              // ),
              //),
            ],
          ),
        ),
      ),
    );
  }

  Container datePicker() {
    return Container(
      margin: EdgeInsets.only(top: 6, left: 14),
      child: DatePicker(
        DateTime.now(),
        width: 80,
        height: 100,
        selectedTextColor: Colors.white,
        selectionColor: primaryClr,
        initialSelectedDate: DateTime.now(),
        dateTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        dayTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        monthTextStyle: GoogleFonts.lato(
          textStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        onDateChange: (newVal) {
          setState(() {
            _selectedDate = newVal;
          });
        },
      ),
    );
  }

  Container taskBar() {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHeadingStyle,
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Today',
                style: subHeadingStyle,
              ),
            ],
          ),
          MyButton(
            label: '+ Add Task',
            onTap: () async {
              await Get.to(AddTaskPage());
              TaskController().getTasks();
            },
          ),
        ],
      ),
    );
  }

  Widget noTaskMsg() {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Wrap(
              direction: SizeConfig.orientation == Orientation.landscape
                  ? Axis.horizontal
                  : Axis.vertical,
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizeConfig.orientation == Orientation.landscape
                    ? SizedBox(
                        height: 6,
                      )
                    : SizedBox(
                        height: 220,
                      ),
                SvgPicture.asset(
                  'assets/images/task.svg',
                  height: 90,
                  color: primaryClr.withOpacity(0.5),
                  semanticsLabel: 'Task',
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'You have not any Tasks yet!\nAdd Tasks to make your day productive',
                    style: subTitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
