import 'package:bloc_graphql_implements_101/presentation/screens/counter/bloc/counter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void testCounterBloc() {
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
}
