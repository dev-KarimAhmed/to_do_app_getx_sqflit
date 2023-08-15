import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final List taskList = <Task>[
    Task(
      title: 'Title 1',
      note: 'this my note for me yes ofcourse 1',
      isCompleted: 0,
      startTime: DateFormat('hh:mm a')
          .format(DateTime.now().add(Duration(minutes: 1)))
          .toString(),
      color: 0,
    ),
  ];
  getTasks() {}
  addTask({Task? task}) {}
}
