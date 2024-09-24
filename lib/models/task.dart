class Task {
  final String id;
  final String title;
  final String? description;
  bool isDone;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
    this.description,
  });
  void toggleDone() {
    isDone = !isDone;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }
}
