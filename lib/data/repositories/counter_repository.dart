import 'package:bloc_graphql_implements_101/data/models/counter_model.dart';

class CounterRepository {
  CounterModel _counter = CounterModel(0);
  CounterModel get counter => _counter;

  void incrementCounter() {
    _counter = CounterModel(_counter.value + 1);
  }
}
