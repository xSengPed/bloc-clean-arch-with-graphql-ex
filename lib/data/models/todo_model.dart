import 'package:uuid/uuid.dart';

class TodoModel {
  final String id = const Uuid().v4();
  final String title;
  final String description;
  bool completed = false;

  TodoModel(
    this.title,
    this.description,
  );
}
