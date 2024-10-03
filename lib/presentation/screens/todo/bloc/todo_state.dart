part of 'todo_bloc.dart';

@immutable
sealed class TodoState extends Equatable {}

final class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

final class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

final class TodoLoaded extends TodoState {
  final List<Todo> todos;
  TodoLoaded(this.todos);

  @override
  List<Object> get props => [todos];
}

final class TodoError extends TodoState {
  final String message;
  TodoError(this.message);
  @override
  List<Object?> get props => [message];
}
