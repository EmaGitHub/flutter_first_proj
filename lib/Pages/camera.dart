import 'dart:io';

import 'package:first_proj/transitions/CustomPageRoute.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => new _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {

  File _image;

  Widget _blueIconRectangle() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.blue,
    );
  }

  Widget _blueDetailRectangle() {
    return Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    );
  }

  @override
  initState() {
    super.initState();
  }

  Future getImage() async {

    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Camera'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: RaisedButton(
                child: Text(
                  'Pick image',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  getImage();
                },
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black26, width: 4),
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
            height: 20.0,
          ),
          ListTile(
            leading: GestureDetector(
              child: Hero(
                tag: 'hero-rectangle',
                child: _blueIconRectangle(),
              ),
              onTap: () => _gotoDetailsPage(context),
            ),
            title: Text('Tap on the icon to view hero animation transition.'),
          ),
          ],
        ));
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      
      CustomPageRoute(
      builder: (ctx) => Scaffold(
        appBar: AppBar(
          title: Text('Landing Page'),
        ),
        body: 
        Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: 'hero-rectangle',
                child: _blueDetailRectangle(),
              ),
              Text(
                  'This is where you can see details about the list item tapped at previous page.'),
            ],
          ),
          ),
        ),
      ),
    ));
  }
}
