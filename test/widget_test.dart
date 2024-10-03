// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_graphql_implements_101/api/api_services.dart';
import 'package:bloc_graphql_implements_101/data/todo.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/counter/bloc/counter_bloc.dart';
import 'package:bloc_graphql_implements_101/presentation/screens/todo/bloc/todo_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiService extends Mock implements ApiServices {}

void main() {
  late MockApiService mockApiService;
  late TodoBloc todoBloc;

  setUp(() {
    mockApiService = MockApiService();
    todoBloc = TodoBloc(mockApiService);
  });

  tearDown(() {
    todoBloc.close();
  });

  group(
    'Counter Bloc',
    () {
      blocTest<CounterBloc, CounterState>(
          'emits [Counter] when Increment is added.',
          build: () => CounterBloc(),
          act: (bloc) => bloc.add(Increment() as CounterEvent),
          expect: () =>
              [isA<Counter>().having((state) => state.value, 'value', 1)]);

      blocTest<CounterBloc, CounterState>(
        'emits [Counter] when Decrement is added.',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(Decrement() as CounterEvent),
        expect: () =>
            [isA<Counter>().having((state) => state.value, 'value', -1)],
      );

      blocTest<CounterBloc, CounterState>(
        'emits [Counter] when Reset is added.',
        build: () => CounterBloc(),
        act: (bloc) => bloc.add(Reset() as CounterEvent),
        expect: () =>
            [isA<Counter>().having((state) => state.value, 'value', 0)],
      );
    },
  );
  group('todo', () {
    blocTest<TodoBloc, TodoState>(
      'emits [MyState] when MyEvent is added.',
      build: () {
        when(() => mockApiService.getTodo()).thenAnswer((_) async => [
              Todo.fromJson({
                "userId": 1,
                "id": 1,
                "title": "delectus aut autem",
                "completed": false
              })
            ]);
        return todoBloc;
      },
      // wait: const Duration(seconds: 3),
      act: (bloc) => bloc.add(FetchTodo()),
      expect: () => [
        TodoLoading(),
        isA<TodoLoaded>()
            .having((state) => state.todos.length, 'todos', greaterThan(0))
      ],
    );
  });
}
