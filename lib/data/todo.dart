class Todo {
  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  late final int userId;
  late final int id;
  late final String title;
  late final bool completed;

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['completed'] = completed;
    return data;
  }
}
