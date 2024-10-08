part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class Reset extends CounterEvent {}

class FetchEvent extends CounterEvent {}
