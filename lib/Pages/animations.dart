import 'package:first_proj/Objects/listObj.dart';
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

  Widget listWidget;

  initState() {
    super.initState();

    new Future<String>.delayed(new Duration(milliseconds: 2000))
        .then((String value) {
      setState(() {
        listWidget = ListObj();
      });
    });

    boxController = AnimationController(
        duration: const Duration(milliseconds: 1900), vsync: this);

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
      end: 330,
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
      end: 400,
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

    Future.delayed(new Duration(milliseconds: 300), () {
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
             child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Opacity(
                opacity: opacityAnimation.value,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  margin: EdgeInsets.only(bottom: 20),
                  width: widthAnimation.value,
                  height: heightAnimation.value,
                  decoration: BoxDecoration(
                    color: colorAnimation.value,
                    border: Border.all(
                      color: Colors.blueAccent, 
                      width: 2),
                    borderRadius: borderRadiusAnimation.value,
                  ),
                  child: 
                    
                    listWidget
                    
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FloatingActionButton(
              heroTag: "btn1",
              tooltip: 'Increment',
              child: Icon(Icons.format_align_center),
              elevation: 20,
              onPressed: () {
                this.animate();
              },
            ),
            FloatingActionButton(
              heroTag: "btn2",
              tooltip: 'Increment',
              child: Icon(Icons.format_color_reset),
              elevation: 20,
              onPressed: () {
                this.animate();
              },
            )
                  ],
                )
            
          ],
        ) ));
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
