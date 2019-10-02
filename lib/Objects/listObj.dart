import 'package:first_proj/Objects/CardPlaceholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class ListObj extends StatefulWidget {
  @override
  _ListObjState createState() => new _ListObjState();
}

class _ListObjState extends State<ListObj> {
  List data = [];
  static int columnCount = 3;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:

            SingleChildScrollView(                                                       //list sliding x
              child:  AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                      duration: const Duration(milliseconds: 800),
                      childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 200.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                      children: <Widget>[
                        for (int i = 1; i < 20; i++) CardPlaceholder()
                      ]),
                ),
              ),
            )
  
    );
  }
}
