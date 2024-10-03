import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_graphql_implements_101/api/api_services.dart';
import 'package:bloc_graphql_implements_101/data/todo.dart';
import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoList todoList = TodoList([]);
  TodoBloc() : super(TodoInitial()) {
    on<OnLoading>(_fetchTodo);
    add(OnLoading());
  }

  void _fetchTodo(OnLoading event, Emitter<TodoState> emit) async {
    emit(TodoLoading());
    List<Todo> result = await ApiServices.getTodo();
    TodoList listResult = TodoList(result);
    emit(listResult);
  }
}
