part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {
  final List<TodoModel> todos;
  TodoInitial(this.todos);
}

final class TodoLoading extends TodoState {}
