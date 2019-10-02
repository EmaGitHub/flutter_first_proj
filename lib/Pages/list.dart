import 'package:first_proj/Objects/CardPlaceholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List data = [];
  static int columnCount = 3;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: 
            /* AnimationLimiter(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 500),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FlipAnimation(
                        child: Text('test'),
                      ),
                    ),
                  );
                },
              ),
            ), */
            /* SingleChildScrollView(
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
            ) */
          AnimationLimiter(
            child: GridView.count(
              crossAxisCount: columnCount,
              children: List.generate(
                50,
                (int index) {
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    duration: const Duration(milliseconds: 800),
                    columnCount: columnCount,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: CardPlaceholder(),
                      ),
                    ),
                  );
                },
              ),
            ),
          )

    );
  }
}
