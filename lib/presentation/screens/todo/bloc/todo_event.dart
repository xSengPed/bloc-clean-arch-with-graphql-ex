part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent extends Equatable {}

class FetchTodo extends TodoEvent {
  @override
  List<Object> get props => [];
}
