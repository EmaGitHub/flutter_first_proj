import 'package:first_proj/Objects/CardPlaceholder.dart';
import 'package:first_proj/Objects/fade_in.dart';
import 'package:flutter/material.dart';

class AnimationsPage extends StatefulWidget {
  @override
  _AnimationsPageState createState() => new _AnimationsPageState();
}

class _AnimationsPageState extends State<AnimationsPage>
    with SingleTickerProviderStateMixin {
  AnimationController boxController;

  bool _visible = true;

  Animation<double> opacityAnimation;
  Animation<double> widthAnimation;
  Animation<double> heightAnimation;
  Animation<BorderRadius> borderRadiusAnimation;
  Animation<Color> colorAnimation;

  initState() {
    super.initState();
    boxController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);

    opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Interval(
          0.0,
          0.3,
          curve: Curves.ease,
        ),
      ),
    );

    borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(0),
      end: BorderRadius.circular(10),
    ).animate(CurvedAnimation(
      parent: boxController,
      curve: Interval(
        0.1,
        0.3,
        curve: Curves.ease,
      ),
    ));

    widthAnimation = Tween<double>(
      begin: 10,
      end: 300,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Interval(
          0.3,
          0.5,
          curve: Curves.ease,
        ),
      ),
    );

    heightAnimation = Tween<double>(
      begin: 10,
      end: 350,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Interval(
          0.5,
          0.7,
          curve: Curves.ease,
        ),
      ),
    );

    colorAnimation = ColorTween(begin: Colors.blueAccent, end: Colors.white)
        .animate(CurvedAnimation(
      parent: boxController,
      curve: Interval(
        0.7,
        1,
        curve: Curves.ease,
      ),
    ));

    Future.delayed(new Duration(milliseconds: 200), () {
      boxController.forward();
    });
  }

  @override
  dispose() {
    boxController.dispose();
    super.dispose();
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animations'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Opacity(
                opacity: opacityAnimation.value,
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                  width: widthAnimation.value,
                  height: heightAnimation.value,
                  decoration: BoxDecoration(
                    color: colorAnimation.value,
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: borderRadiusAnimation.value,
                  ),
                  child: ListView(
                    children: <Widget>[
                      for (int i = 1; i < 5; i++)
                         FadeIn(i*0.5+4,  CardPlaceholder()),     
                         //StringObj(text: 'test',delay: 2000+i*100)
                    ],
                  ),
                )),
            FloatingActionButton(
              heroTag: "btn",
              tooltip: 'Increment',
              child: Icon(Icons.format_align_center),
              elevation: 20,
              onPressed: () {
                this.animate();
              },
            )
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: boxController,
    );
  }

  animate() {
    if (this._visible) {
      this.boxController.reverse();
    } else {
      this.boxController.forward();
    }
    this._visible = !this._visible;
  }
}
