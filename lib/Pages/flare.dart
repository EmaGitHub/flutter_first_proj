import 'package:first_proj/animations/smart_flare_animation.dart';
import 'package:flutter/material.dart';

class FlarePage extends StatefulWidget {
  @override
  _FlarePageState createState() => new _FlarePageState();
}

class _FlarePageState extends State<FlarePage> {
  bool isOpen = true;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: SmartFlareAnimation())
          );
  }
}
