import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component
import 'dart:math'; //Libreria per funzioni matematiche

class LayoutSet extends StatelessWidget {
  
  const LayoutSet({Key key, this.text}) : super(key: key);
  final String text;

  static const _PATH = "assets/images";
  static const _PIC01 = "$_PATH/apps.png";
  static const _PIC02 = "$_PATH/logged_user.png";
  static const _GIF01 = "assets/gifs/FlappingFlagTheory.gif";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.text),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
                  child: Text(
                    "Definition of a TextStyle with basic parameters",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'FFF_Tusj',
                        fontSize: 25,
                        color: Colors.lightBlue[700],
                        shadows: [
                          /* Shadow(
                            color: Colors.black,
                            offset: Offset(1, 3),
                            blurRadius: 2), */
                          /* Shadow(
                            color: Colors.cyan,
                            offset: Offset(3, 1),
                            blurRadius: 2) */
                        ]),
                  )),
              Container(
                constraints: BoxConstraints.expand(height: 300),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(_GIF01),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 300,
                ),
              ),
              Container(
                width: 300.0,
                height: 50.0,
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text("Container width = 300 , height = 50"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 300),
                alignment: Alignment.center,
                child: Image.asset(
                  _PIC01,
                  fit: BoxFit.cover,
                  color: Colors.purple,
                  colorBlendMode: BlendMode.colorDodge,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.orange,
                child: Text(
                    "\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\n"),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10, bottom: 10),
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20, bottom: 20),
                child: Container(
                  color: Colors.orangeAccent[200],
                  child: Text("Container with margin and padding"),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 100.0, width: 200),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    color: Colors.red),
                child: Text("Container with ShapeDecoration"),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                constraints: BoxConstraints.expand(height: 200),
                alignment: Alignment.centerLeft,
                color: Colors.lightGreenAccent[700],
                transform: Matrix4.rotationY(pi / 5)..rotateX(pi / 5),
                child: Text("Transform"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 50),
                margin: EdgeInsets.only(bottom: 15),
                child: Image.asset(
                  _PIC02,
                  repeat: ImageRepeat.repeatX,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ));
  }
}