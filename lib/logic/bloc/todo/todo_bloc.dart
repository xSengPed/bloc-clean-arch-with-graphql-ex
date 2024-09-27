import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_graphql_implements_101/data/models/todo_model.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial(const [])) {
    on<TodoEvent>((event, emit) {
      if (event is AddTodoEvent) {
        log(event.todo.toString());
        log(event.todo.id.toString());
        final updatedTodo = List<TodoModel>.from((state as TodoInitial).todos)
          ..add(event.todo);
        emit(TodoInitial(updatedTodo));
      }
    });
  }
}
