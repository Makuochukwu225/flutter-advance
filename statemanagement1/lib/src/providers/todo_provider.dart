import 'dart:developer';

import '../src.dart';

class TodoProvider {
  static final TodoProvider _instance = TodoProvider._internal();

  factory TodoProvider() {
    return _instance;
  }

  TodoProvider._internal();
  ValueNotifier<List<TodoModel>> tasksNotifier =
      ValueNotifier<List<TodoModel>>([]);

  addNewTask({required TodoModel task}) {
    final List<TodoModel> tasks = [...tasksNotifier.value];
    tasks.add(task);
    tasksNotifier.value = tasks;
    log("list ${tasksNotifier.value}");
  }

  finishTask({required String taskId}) {
    final List<TodoModel> tasks = [...tasksNotifier.value];

    final int index = tasks.indexWhere((task) => task.id == taskId);
    tasks[index].isDone = true;

    tasksNotifier.value = tasks;
  }

  uncheckTask({required String taskId}) {
    final List<TodoModel> tasks = [...tasksNotifier.value];

    final int index = tasks.indexWhere((task) => task.id == taskId);
    tasks[index].isDone = false;

    tasksNotifier.value = tasks;
  }
}
