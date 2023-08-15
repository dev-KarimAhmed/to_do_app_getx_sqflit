import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/task_controller.dart';
import '../../models/task.dart';
import '../../services/theme_services.dart';
import '../theme.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';
import 'notification_screen.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TaskController taskController = Get.put(TaskController());
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime =
      DateFormat('hh:mm a').format(DateTime.now().add(Duration(minutes: 15)));
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedRepeat = 'None';
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'Monthly'];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 24,
            color: primaryClr,
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
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Add Task',
                style: titleStyle,
              ),
              InputField(
                hint: 'title',
                title: 'title',
                controller: titleController,
              ),
              SizedBox(height: 10),
              InputField(
                hint: 'Add a note',
                title: 'note',
                controller: noteController,
              ),
              SizedBox(height: 10),
              InputField(
                hint: '${DateFormat().add_yMd().format(selectedDate)}',
                title: 'Date',
                widget: IconButton(
                    onPressed: () => getDateFromUser(),
                    icon: Icon(Icons.calendar_today_outlined)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      hint: '$startTime',
                      title: 'Start Time',
                      widget: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: true),
                        icon: Icon(
                          Icons.access_time,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: InputField(
                      hint: '$endTime',
                      title: 'End Time',
                      widget: IconButton(
                        onPressed: () => getTimeFromUser(isStartTime: false),
                        icon: Icon(
                          Icons.access_time,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              InputField(
                hint: '$selectedRemind minutes early',
                title: 'Remind',
                widget: Row(
                  children: [
                    DropdownButton(
                        borderRadius: BorderRadius.circular(16),
                        dropdownColor: Colors.blueGrey,
                        underline: Container(),
                        items: remindList
                            .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(
                                        value.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                            .toList(),
                        onChanged: (newVal) {
                          setState(() {
                            selectedRemind = int.parse(newVal!);
                          });
                        }),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 10),
              InputField(
                hint: '$selectedRepeat',
                title: 'Repeat',
                widget: Row(
                  children: [
                    DropdownButton(
                        borderRadius: BorderRadius.circular(16),
                        dropdownColor: Colors.blueGrey,
                        underline: Container(),
                        items: repeatList
                            .map<DropdownMenuItem<String>>(
                                (value) => DropdownMenuItem<String>(
                                      value: value.toString(),
                                      child: Text(
                                        value.toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ))
                            .toList(),
                        onChanged: (newVal) {
                          setState(() {
                            selectedRepeat = newVal!;
                          });
                        }),
                    SizedBox(width: 8),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Color',
                        style: titleStyle,
                      ),
                      colorPalette(),
                    ],
                  ),
                  MyButton(
                    label: 'Create Task',
                    onTap: () {
                      validateData();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Wrap colorPalette() {
    return Wrap(
      children: List.generate(
          3,
          (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedColor = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: CircleAvatar(
                    child: selectedColor == index
                        ? Icon(
                            Icons.done,
                            color: Colors.white,
                            size: 14,
                          )
                        : null,
                    backgroundColor: index == 0
                        ? primaryClr
                        : index == 1
                            ? pinkClr
                            : orangeClr,
                    radius: 16,
                  ),
                ),
              )),
    );
  }

  validateData() async {
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      addTasksToDB();
      Get.back();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        'Required',
        'All Fields Are Required!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: pinkClr,
        icon: Icon(
          Icons.warning,
          color: pinkClr,
        ),
      );
    } else {
      print(
          '------------------------SomeThing bad  happened--------------------');
    }
  }

  addTasksToDB() async {
    int value = await taskController.addTask(
      task: Task(
        title: titleController.text,
        note: noteController.text,
        date: DateFormat.yMd().format(selectedDate),
        startTime: startTime,
        endTime: endTime,
        remind: selectedRemind,
        repeat: selectedRepeat,
        color: selectedColor,
        isCompleted: 0,
      ),
    );
    print('value is $value');
  }

  getDateFromUser() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2050),
    );
    setState(() {
      selectedDate = pickedDate ?? selectedDate;
    });
  }

  getTimeFromUser({required bool isStartTime}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(DateTime.now().add(Duration(minutes: 15))),
    );

    String formattedTime = pickedTime!.format(context);
    if (isStartTime) {
      setState(() {
        startTime = formattedTime;
      });
    } else if (!isStartTime) {
      setState(() {
        endTime = formattedTime;
      });
    } else {
      debugPrint('is null or someThing was error');
    }
  }
}
