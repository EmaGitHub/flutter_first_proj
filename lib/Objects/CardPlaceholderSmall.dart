import 'package:first_proj/Pages/animations_landing.dart';
import 'package:first_proj/transitions/CustomPageRoute.dart';
import 'package:flutter/material.dart';

class CardPlaceholderSmall extends StatefulWidget {
  final int id;

  CardPlaceholderSmall({Key key, @required this.id}) : super(key: key);

  @override
  _CardPlaceholderSmallState createState() => new _CardPlaceholderSmallState();
}

class _CardPlaceholderSmallState extends State<CardPlaceholderSmall>
    with SingleTickerProviderStateMixin {
  initState() {
    super.initState();
  }

  static const _GIF01 = "assets/gifs/alfaveyron.gif";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CustomPageRoute(
              builder: (ctx) => AnimationsLandingPage(id: widget.id)));
        },
        child: Hero(
            tag: 'hero-card' + widget.id.toString(),
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Card(
                elevation: 3,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
            
                         Center(
                           child: Text('Obj')
                         )
                    ],
                ),
              ),
            )));
  }
}
