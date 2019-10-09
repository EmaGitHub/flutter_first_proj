import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CounterBloc{
  
  int _counter = 0;

  final _counter$ = BehaviorSubject<int>.seeded(0);

  final _incrementController = StreamController<void>();
  final _decrementController = StreamController<void>();

  CounterBloc() {
    _incrementController.stream.listen((void _) => _counter$.add(++_counter));
    _decrementController.stream.listen((void _) => _counter$.add(--_counter));
  }

  Sink<void> get increment => _incrementController.sink;
  Sink<void> get decrement => _decrementController.sink;

  Stream<int> get counter$ => _counter$.stream;

  void dispose() {
    _incrementController.close();
    _decrementController.close();
    _counter$.close();
  }
}