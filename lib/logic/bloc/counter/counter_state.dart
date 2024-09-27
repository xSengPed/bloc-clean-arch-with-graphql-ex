part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int counter;
  const CounterState(this.counter);
}

class CounterInitial extends CounterState {
  const CounterInitial(super.counter);
}
