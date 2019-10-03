import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => new _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File _image;

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
          ],
        ));
  }
}
