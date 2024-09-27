part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTodoEvent extends TodoEvent {
  final TodoModel todo;
  AddTodoEvent(this.todo);
}

class RemoveTodoEvent extends TodoEvent {}

class UpdateTodoEvent extends TodoEvent {}
