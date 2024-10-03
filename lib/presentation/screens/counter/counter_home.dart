import 'dart:developer';

import 'package:bloc_graphql_implements_101/presentation/screens/counter/bloc/counter_bloc.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/todo/todo_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc bloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Home'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${bloc.counter.value}',
                          style: const TextStyle(fontSize: 30)),
                    ],
                  );
                },
                bloc: bloc),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, padding: const EdgeInsets.all(10)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const TodoHome()));
                          },
                          child: const Text("Todo")))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      bloc.add(Increment());
                    },
                    child: const Text('Increment')),
                TextButton(
                    onPressed: () {
                      bloc.add(Reset());
                    },
                    child: const Text('Reset')),
                TextButton(
                    onPressed: () {
                      bloc.add(Decrement());
                    },
                    child: const Text('Decrement')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
