import 'dart:developer';
import 'dart:ffi';

import 'package:bloc_graphql_implements_101/data/models/todo_model.dart';
import 'package:bloc_graphql_implements_101/logic/bloc/todo/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TodoBloc todoProvider = BlocProvider.of<TodoBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoProvider.add(AddTodoEvent(TodoModel("title", "description")));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          log(state.toString());
          if (state is TodoInitial) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todos[index].title),
                  subtitle: Text(state.todos[index].description),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
