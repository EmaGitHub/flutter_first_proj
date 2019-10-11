// 1
import 'package:first_proj/Zomato/BLoCLayer/bloc.dart';
import 'package:flutter/widgets.dart';

class BlocProviderZomato<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProviderZomato({Key key, @required this.bloc, @required this.child})
      : super(key: key);

  // 2
  static T of<T extends Bloc>(BuildContext context) {
    final type = _providerType<BlocProviderZomato<T>>();
    final BlocProviderZomato<T> provider = context.ancestorWidgetOfExactType(type);
    return provider.bloc;
  }

  // 3
  static Type _providerType<T>() => T;

  @override
  State createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProviderZomato> {
  // 4
  @override
  Widget build(BuildContext context) => widget.child;

  // 5
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}