import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/task.dart';

class TaskController extends GetxController {
  final List taskList = <Task>[
    Task(
      title: 'Title 1',
      note: 'this my note for me yes ofcourse 1',
      isCompleted: 0,
      startTime: '06:45',
      endTime: '08:20',
      color: 0,
    ),
    Task(
      title: 'Title 2',
      note: 'this my note for me yes ofcourse 2',
      isCompleted: 1,
      startTime: '07:45',
      endTime: '08:20',
      color: 1,
    ),
    Task(
      title: 'Title 3',
      note: 'this my note for me yes ofcourse 3',
      isCompleted: 0,
      startTime: '02:45',
      endTime: '08:20',
      color: 2,
    ),
    Task(
      title: 'Title 4',
      note: 'this my note for me yes ofcourse 4',
      isCompleted: 0,
      startTime: '06:45',
      endTime: '12:20',
      color: 0,
    ),
    Task(
      title: 'Title 4',
      note: 'this my note for me yes ofcourse 4',
      isCompleted: 0,
      startTime: '06:45',
      endTime: '12:20',
      color: 0,
    ),
  ];
  getTasks() {}
}
