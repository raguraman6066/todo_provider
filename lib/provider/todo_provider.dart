import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  List<String> _pendingTaskList = [];

  List<String> get taskList {
    return [..._pendingTaskList];
  }

  addTask(String taskName) {
    _pendingTaskList.add(taskName);
    notifyListeners();
  }

  List<String> _completedTask = [];
  List<String> get completedTask {
    return [..._completedTask];
  }

  addToCompleteFormPending(String task) {
    _pendingTaskList.remove(task);
    _completedTask.add(task);
    notifyListeners();
  }
}
