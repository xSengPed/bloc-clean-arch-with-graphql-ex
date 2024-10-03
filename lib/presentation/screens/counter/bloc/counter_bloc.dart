import 'dart:developer';

import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  Counter counter = Counter(0);

  CounterBloc() : super(CounterInitial()) {
    on<Increment>(_increment);
    on<Decrement>(_decrement);
    on<Reset>(_reset);
    on<FetchEvent>(_initialAction);
    add(FetchEvent());
  }

  void _initialAction(FetchEvent event, Emitter<CounterState> emit) {
    log("initial action");
  }

  void _increment(Increment event, Emitter<CounterState> emit) {
    counter = Counter(counter.value + 1);
    emit(counter);
  }

  void _decrement(Decrement event, Emitter<CounterState> emit) {
    counter = Counter(counter.value - 1);
    emit(counter);
  }

  void _reset(Reset event, Emitter<CounterState> emit) {
    counter = Counter(0);
    emit(counter);
  }
}
