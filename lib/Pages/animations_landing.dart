import 'package:flutter/material.dart';

class AnimationsLandingPage extends StatefulWidget {
  final int id;

  AnimationsLandingPage({Key key, @required this.id}) : super(key: key);
  @override
  _AnimationsLandingPageState createState() =>
      new _AnimationsLandingPageState();
}

class _AnimationsLandingPageState extends State<AnimationsLandingPage> {

  static const _GIF01 = "assets/gifs/alfaveyron.gif";

  @override
  initState() {
    super.initState();

    WidgetsBinding.instance
        .addPostFrameCallback((_) => print('Ready'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animations detail'),
        ),
        body: Hero(
            tag: 'hero-card' + widget.id.toString(),
            child: SingleChildScrollView(
              child: Container(
              margin: EdgeInsets.all(10),
              height: 400,
              child: Card(
                elevation: 3,
                shape: new RoundedRectangleBorder(
                    side: new BorderSide(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Container(
                  padding: EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        WhitespaceSeparator(),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            /* FadeIn(1, SquarePlaceholder()),
                            FadeIn(1.25, SquarePlaceholder()),
                            FadeIn(1.5, SquarePlaceholder()) */
                             SquarePlaceholder(),
                              SquarePlaceholder(),
                               SquarePlaceholder()
                          ],
                        ), */
                        WhitespaceSeparator(),
                        HeaderPlaceholder(),
                        WhitespaceSeparator(),
                        /* Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            /* FadeIn(1, SquarePlaceholder()),
                            FadeIn(1.25, SquarePlaceholder()),
                            FadeIn(1.5, SquarePlaceholder()) */
                             SquarePlaceholder(),
                               SquarePlaceholder()
                          ],
                        ), */
                        WhitespaceSeparator(),
                        Expanded(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    color: Colors.grey,
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 40, 0),
                                    color: Colors.grey.shade300,
                                    height: 8,
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(5, 5, 25, 0),
                                    color: Colors.grey.shade300,
                                    height: 8,
                                  ),
                                ],
                              ),
                            )
                      ]),
                ),
              ),
            ))));
  }
}

class SquarePlaceholder extends StatelessWidget {
  const SquarePlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.grey.shade300,
      ),
    );
  }
}

class HeaderPlaceholder extends StatelessWidget {
  const HeaderPlaceholder({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.all(Radius.circular(5))),
    );
  }
}

class WhitespaceSeparator extends StatelessWidget {
  const WhitespaceSeparator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
    );
  }
}
