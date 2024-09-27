import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        log('message: IncrementEvent');
        emit(CounterInitial(state.counter + 1));
      }

      if (event is DecrementEvent) {
        log('message: DecrementEvent');
        emit(CounterInitial(state.counter - 1));
      }

      if (event is ResetEvent) {
        log('message: CounterResetEvent');
        emit(const CounterInitial(0));
      }
    });
  }
}
