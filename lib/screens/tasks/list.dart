// Suggested code may be subject to a license. Learn more: ~LicenseLog:2709694355.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3999046673.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:2170057629.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:4058942781.
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/services/db.dart';

import 'package:myapp/stores/tasks_store.dart';
import 'package:provider/provider.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final DbService dbService = DbService();
  late final TasksStore tasksStore;
  @override
  void initState() {
    tasksStore = context.read<TasksStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      final tasks = tasksStore.tasks;
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tasks',
          ),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description ?? ''),
              trailing: Row(
                children: [
                  Checkbox(
                    value: task.isDone,
                    onChanged: (value) {
                      setState(
                        () {
                          task.isDone = value!;
                        },
                      );
                      dbService.updateTask(task);
                    },
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      tasksStore.removeTask(task);
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push(
              '/add',
            );
          },
          child: const Icon(Icons.add),
        ),
      );
    });
  }
}
