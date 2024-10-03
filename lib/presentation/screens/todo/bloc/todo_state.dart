part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

class TodoList extends TodoState {
  final List<Todo> todos;
  TodoList(this.todos);
}
