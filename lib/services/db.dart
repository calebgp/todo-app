import 'package:hive/hive.dart';
import 'package:myapp/models/task.dart';

class DbService {
  static final DbService _instance = DbService._internal();
  factory DbService() => _instance;

  DbService._internal();

  static Box<Task>? _box;

  Future<Box<Task>> get box async {
    if (_box != null) return _box!;
    _box = await Hive.openBox<Task>('tasks');
    return _box!;
  }

  Future<void> addTask(Task task) async {
    final box = await this.box;
    await box.put(task.id, task);
  }

  Future<List<Task>> getTasks() async {
    final box = await this.box;
    return box.values.toList();
  }

  Future<Task?> getTask(String key) async {
    final box = await this.box;
    return box.get(key);
  }

  Future<void> updateTask(Task task) async {
    final box = await this.box;
    await box.put(task.id, task);
  }

  Future<void> deleteTask(String key) async {
    final box = await this.box;
    await box.delete(key);
  }
}
