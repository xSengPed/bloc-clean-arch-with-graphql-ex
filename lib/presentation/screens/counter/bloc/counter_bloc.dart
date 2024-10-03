import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  Counter counter = Counter(0);
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      log(event.toString());
      if (event is Increment) {
        emit(counter = Counter(counter.value + 1));
      }

      if (event is Decrement) {
        emit(counter = Counter(counter.value - 1));
      }

      if (event is Reset) {
        emit(counter = Counter(0));
      }
    });
  }
}
