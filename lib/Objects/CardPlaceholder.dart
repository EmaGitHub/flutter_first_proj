import 'package:first_proj/Pages/animations_landing.dart';
import 'package:flutter/material.dart';

class CardPlaceholder extends StatefulWidget {
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
    return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimationsLandingPage()),
            );
          },
          child: Card(
            elevation: 3,
            shape: new RoundedRectangleBorder(
                side: new BorderSide(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
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
                          margin: EdgeInsets.fromLTRB(20, 5, 0, 0),
                          color: Colors.grey.shade300,
                          height: 7,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
