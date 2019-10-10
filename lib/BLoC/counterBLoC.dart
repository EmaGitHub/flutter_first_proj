import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:rxdart/subjects.dart';

class CounterBloc{
  
  int _counter = 0;

  final _counter$ = BehaviorSubject<int>(); //.seeded(0);

  final _incrementController = StreamController<int>();
  final _decrementController = StreamController<int>();

  CounterBloc() {
    //StreamSubscription s = 
    _incrementController.stream.listen((void _) => _counter$.add(++_counter));
    _decrementController.stream.listen((void _) => _counter$.add(--_counter));
  }

  Sink<int> increment() => _incrementController.sink;
  Sink<int> decrement() => _decrementController.sink;

  Stream<int> counter$() => _counter$.stream;

  void dispose() {
    _incrementController.close();
    _decrementController.close();
    _counter$.close();
  }

  updateCounter(bool b){

    if(b){


    }
    else{


    }

  }
}