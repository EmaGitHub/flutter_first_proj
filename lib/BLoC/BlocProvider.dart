import 'package:first_proj/BLoC/counterBLoC.dart';
import 'package:flutter/material.dart';

class BlocProvider extends InheritedWidget {
  final CounterBloc bloc;

  BlocProvider({Key key, this.bloc, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CounterBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider).bloc;
}