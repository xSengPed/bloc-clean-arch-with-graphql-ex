import 'package:bloc_graphql_implements_101/api/api_services.dart';
import 'package:bloc_graphql_implements_101/di.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/counter/counter_home.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/todo/todo_test.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/counter/bloc/counter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          // Initialize TodoBloc and fetch the data
          BlocProvider(
            create: (context) =>
                TodoBloc(getIt.get<ApiServices>())..add(FetchTodo()),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const CounterHome(),
        ));
  }
}
