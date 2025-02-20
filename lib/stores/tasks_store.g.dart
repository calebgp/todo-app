// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksStore on _TasksStore, Store {
  late final _$tasksAtom = Atom(name: '_TasksStore.tasks', context: context);

  @override
  ObservableList<Task> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<Task> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$fetchTasksAsyncAction =
      AsyncAction('_TasksStore.fetchTasks', context: context);

  @override
  Future fetchTasks() {
    return _$fetchTasksAsyncAction.run(() => super.fetchTasks());
  }

  late final _$_TasksStoreActionController =
      ActionController(name: '_TasksStore', context: context);

  @override
  void addTask(Task task) {
    final _$actionInfo =
        _$_TasksStoreActionController.startAction(name: '_TasksStore.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeTask(Task task) {
    final _$actionInfo = _$_TasksStoreActionController.startAction(
        name: '_TasksStore.removeTask');
    try {
      return super.removeTask(task);
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
