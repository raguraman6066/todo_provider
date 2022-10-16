import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/todo_provider.dart';

class CompletedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var taskList = Provider.of<TodoProvider>(context).completedTask;
    return Scaffold(
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(taskList[index]),
                ),
              )),
    );
  }
}
