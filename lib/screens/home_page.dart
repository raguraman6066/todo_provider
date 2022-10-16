import 'package:flutter/material.dart';
import 'package:todo_pro_flutter/screens/completed_page.dart';
import 'package:todo_pro_flutter/screens/pending_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text(
                'TODO LIST',
              ),
              bottom: const TabBar(tabs: [
                Tab(
                  child: Text('Pending'),
                ),
                Tab(
                  child: Text('Completed'),
                ),
              ]),
            ),
            body: TabBarView(
              children: [
                PendingPage(),
                CompletedPage(),
              ],
            )));
  }
}
