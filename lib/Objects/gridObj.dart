import 'package:first_proj/Objects/CardPlaceholderSmall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class GridObj extends StatefulWidget {
  @override
  _GridObjState createState() => new _GridObjState();
}

class _GridObjState extends State<GridObj> {

  final int columnCount= 3;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  AnimationLimiter(                                                               //grid scale & fadeIn
              child: 
              GridView.count(
                crossAxisCount: columnCount,
                children: List.generate(
                  30,
                  (int index) {
                    return AnimationConfiguration.staggeredGrid(
                      position: index,
                      duration: const Duration(milliseconds: 800),
                      columnCount: columnCount,
                      child: ScaleAnimation(
                        child: FadeInAnimation(
                          //child: FlipAnimation(
                            child: Container(
                              child: CardPlaceholderSmall(id: index),
                            )
                          //)
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
  }
}
