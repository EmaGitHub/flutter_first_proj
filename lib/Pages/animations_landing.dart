import 'package:flutter/material.dart';

class AnimationsLandingPage extends StatefulWidget {

  @override
  _AnimationsLandingPageState createState() => new _AnimationsLandingPageState();

}

class _AnimationsLandingPageState extends State<AnimationsLandingPage> {
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

          Text('a')
    );
  }
}
