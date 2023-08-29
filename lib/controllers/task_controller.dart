// import 'package:get/get.dart';
// import 'package:to_do_app_getx_sqflit/db/db_helper.dart';

// import '../models/task.dart';

// class TaskController extends GetxController {
//   final List taskList = <Task>[].obs;

//   Future<void> getTasks() async {
//     final List<Map<String, dynamic>> tasks = await DBHelper.query();
//     taskList.assignAll(tasks.map((data) => Task.fromJson(data)).toList());
//   }

//   Future<int> addTask({Task? task}) async {
//     return DBHelper.insert(task);
//   }

//   void deleteTask({Task? task}) async {
//     await DBHelper.delete(task);
//     getTasks();
//   }

//   void markTaskComplete({required int id}) async {
//     await DBHelper.update(id);
//     getTasks();
//   }
// }
