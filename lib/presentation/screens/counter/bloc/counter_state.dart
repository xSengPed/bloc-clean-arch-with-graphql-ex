part of 'counter_bloc.dart';

@immutable
sealed class CounterState {}

final class CounterInitial extends CounterState {}

class Counter extends CounterState {
  final int value;
  Counter(this.value);
}
