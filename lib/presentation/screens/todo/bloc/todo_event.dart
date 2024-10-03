part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class OnLoading extends TodoEvent {}

class OnFinish extends TodoEvent {}
