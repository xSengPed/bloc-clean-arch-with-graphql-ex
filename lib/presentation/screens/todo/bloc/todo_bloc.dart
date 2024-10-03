import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_graphql_implements_101/api/api_services.dart';
import 'package:bloc_graphql_implements_101/data/todo.dart';
import 'package:equatable/equatable.dart';

import 'package:meta/meta.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final ApiServices apiServices;
  TodoBloc(this.apiServices) : super(TodoLoading()) {
    on<TodoEvent>((event, emit) async {
      //
      if (event is FetchTodo) {
        //
        emit(TodoLoading());
        final result = await apiServices.getTodo();
        emit(TodoLoaded(result));
      }
    });
  }
}
