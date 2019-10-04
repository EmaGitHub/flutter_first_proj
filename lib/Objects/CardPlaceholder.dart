import 'package:first_proj/Pages/animations_landing.dart';
import 'package:first_proj/transitions/CustomPageRoute.dart';
import 'package:flutter/material.dart';

class CardPlaceholder extends StatefulWidget {

  final int id;

  CardPlaceholder({Key key, @required this.id})
      : super(key: key);

  @override
  _CardPlaceholderState createState() => new _CardPlaceholderState();
}

class _CardPlaceholderState extends State<CardPlaceholder>
    with SingleTickerProviderStateMixin {
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(

            CustomPageRoute(
              builder: (ctx) => AnimationsLandingPage(id: widget.id)
            )
          );
        },
        child: Hero(
            tag: 'hero-card'+widget.id.toString(), 
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              height: 80,
              child: Card(
                elevation: 3,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(
                      color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)
                      ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: ClipOval(
                          child: Container(
                            color: Colors.grey.shade300,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            Container(
                              color: Colors.grey,
                              height: 10,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 10, 0),
                              color: Colors.grey.shade300,
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                              color: Colors.grey.shade300,
                              height: 8,
                            ),             
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        );
  }
}
