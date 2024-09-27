import 'package:bloc_graphql_implements_101/logic/bloc/counter/counter_bloc.dart';
import 'package:bloc_graphql_implements_101/logic/bloc/todo/todo_bloc.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => TodoBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const App(),
        ));
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${counterProvider.state.counter}',
                ),
                ElevatedButton(
                    onPressed: () {
                      counterProvider.add(IncrementEvent());
                    },
                    child: const Text('Increment')),
                ElevatedButton(
                    onPressed: () {
                      counterProvider.add(DecrementEvent());
                    },
                    child: const Text('Decrement')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TodoScreen()));
                    },
                    child: const Text('Todo')),
              ],
            ),
          );
        },
      ),
    );
  }
}
