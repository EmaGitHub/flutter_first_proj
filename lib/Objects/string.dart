import 'package:flutter/material.dart';

class StringObj extends StatefulWidget {

  String text;
  int delay;

  StringObj({Key key, @required this.text, @required this.delay})
      : super(key: key);

  @override
  _StringObjState createState() => new _StringObjState();
}

class _StringObjState extends State<StringObj> with TickerProviderStateMixin {
  AnimationController translationStringController;
  Animation<Offset> translationStringAnimation;

  AnimationController opacityStringController;
  Animation<double> opacityStringAnimation;

  initState() {
    super.initState();

    translationStringController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    translationStringAnimation =
        Tween<Offset>(begin: Offset(5.4, 0), end: Offset.zero)
            .animate(translationStringController);

    opacityStringController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    opacityStringAnimation =
        CurvedAnimation(parent: opacityStringController, curve: Curves.easeIn);

    Duration duration = new Duration(milliseconds: widget.delay);
    Future.delayed(duration, () {
      translationStringController.forward();
      opacityStringController.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: EdgeInsets.only(top: 15),
        child: Align(
            
            alignment: Alignment.topLeft,
            child: FadeTransition(
              opacity: opacityStringAnimation,
              child: SlideTransition(
                
                position: translationStringAnimation,
                child: 
                  
                  Text(widget.text,
                    style: new TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                    )),
              ),
            )));
  }
}
