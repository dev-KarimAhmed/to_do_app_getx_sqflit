import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../controllers/task_controller.dart';
import '../theme.dart';
import '../widgets/input_field.dart';

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
      appBar: AppBar(),
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
              InputField(
                hint: 'Add a note',
                title: 'note',
                controller: noteController,
              ),
              InputField(
                hint: '${DateFormat().add_yMd().format(selectedDate)}',
                title: 'Date',
                controller: noteController,
                widget: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_today_outlined)),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      hint: '$startTime',
                      title: 'Start Time',
                      controller: noteController,
                      widget: IconButton(
                          onPressed: () {}, icon: Icon(Icons.access_time)),
                    ),
                  ),
                  Expanded(
                    child: InputField(
                      hint: '$endTime',
                      title: 'End Time',
                      controller: noteController,
                      widget: IconButton(
                          onPressed: () {}, icon: Icon(Icons.access_time)),
                    ),
                  ),
                ],
              ),
              InputField(
                hint: '$selectedRemind minutes early',
                title: 'Remind',
                widget: DropdownButton(
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
              ),
              InputField(
                hint: '$selectedRepeat',
                title: 'Repeat',
                widget: DropdownButton(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
