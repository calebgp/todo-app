// Suggested code may be subject to a license. Learn more: ~LicenseLog:1194152670.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:15344624.
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:myapp/models/task.dart';
import 'package:myapp/services/db.dart';

part 'tasks_store.g.dart';

class TasksStore = _TasksStore with _$TasksStore;

abstract class _TasksStore with Store {
  @observable
  ObservableList<Task> tasks = ObservableList<Task>();
  final DbService dbService = DbService();
  _TasksStore() {
    unawaited(fetchTasks());
  }

  @action
  void addTask(Task task) {
    var list = ObservableList<Task>.of(tasks);
    list.add(task);
    tasks = list;
    dbService.addTask(task);
  }

  @action
  void removeTask(Task task) {
    var list = ObservableList<Task>.of(tasks);
    list.remove(task);
    tasks = list;
    dbService.deleteTask(task.id);
  }

  @action
  Future<void> fetchTasks() async {
    final tasks = await dbService.getTasks();
    this.tasks = ObservableList<Task>.of(tasks);
  }
}
