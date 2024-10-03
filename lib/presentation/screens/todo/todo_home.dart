import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/todo_bloc.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo"),
      ),
      body: Column(
        children: [
          Flexible(
              child: BlocSelector<TodoBloc, TodoState, TodoState>(
            selector: (state) => state,
            builder: (context, state) {
              log(state.toString());
              if (state is TodoLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TodoList) {
                return ListView.builder(
                    itemCount: state.todos.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.todos[index].title),
                      );
                    });
              }
              return const Center(
                child: Text("Error To Loading Data"),
              );
            },
          ))
        ],
      ),
    );
  }
}
