import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_pro_flutter/provider/todo_provider.dart';
import 'package:todo_pro_flutter/screens/completed_page.dart';

class PendingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoProvider>(context);
    final taskList = provider.taskList;
    return Scaffold(
      body: ListView.builder(
          itemCount: taskList.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(taskList[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.done),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Task Completed')));
                      provider.addToCompleteFormPending(taskList[index]);
                    },
                  ),
                ),
              )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showTextField(context);
        },
      ),
    );
  }

  var taskName = TextEditingController();
  showTextField(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: Text(
                'Add Task',
              ),
              content: TextField(
                controller: taskName,
                decoration: InputDecoration(hintText: 'Task Name'),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel')),
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<TodoProvider>(context, listen: false)
                              .addTask(taskName.text);
                          Navigator.of(context).pop();
                          taskName.text = '';
                        },
                        child: Text('Submit')),
                  ],
                )
              ],
            ));
  }
}
