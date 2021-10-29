import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_flutter/models/task.dart';

class TaskDB with ChangeNotifier {
  addTask(Task task) async {
    var box = await Hive.openBox<Task>('task');

    box.add(task);

    notifyListeners();
  }

  List _taskList = <Task>[];
  List get taskList => _taskList;

  queryTasks() async {
    final box = await Hive.openBox<Task>('task');

    _taskList = box.values.toList();

    notifyListeners();
  }

  updateTask(int index, Task task) async {
    final box = await Hive.openBox<Task>('task');

    box.putAt(index, task);

    debugPrint(task.completed.toString());

    notifyListeners();
  }

  deletTask(int index) async {
    final box = await Hive.openBox<Task>('task');

    box.deleteAt(index);

    queryTasks();

    notifyListeners();
  }

  deletAllTasks() async {
    final box = await Hive.openBox<Task>('task');

    box.deleteFromDisk();
  }
}
