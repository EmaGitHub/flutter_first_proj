import 'package:first_proj/Objects/CardPlaceholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class ListVertObj extends StatefulWidget {
  @override
  _ListVertObjState createState() => new _ListVertObjState();
}

class _ListVertObjState extends State<ListVertObj> {

  final int columnCount= 3;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimationLimiter(                                                          //List vertical offset
              child: ListView.builder(
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    child: SlideAnimation(
                      verticalOffset: -50.0,
                      child: FadeInAnimation(
                        child: CardPlaceholder(id: index),
                      ),
                    ),
                  );
                },
              ),
            );
  }
}
