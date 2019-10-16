import 'package:first_proj/PageService/service.dart';
import 'package:first_proj/examples/fancy_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:first_proj/main.dart';


class MyDrawer extends StatefulWidget{

  MyDrawer({Key key}) : super(key: key);

  @override
  _DrawerState createState() => new _DrawerState();

}


  class _DrawerState extends State<MyDrawer>{

      initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new prefix0.Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  child: FancyBackgroundApp(),
                ),
              ),
              ListTile(
                leading: new Icon(Icons.airline_seat_legroom_normal),
                title: Text('Home Page'),
                onTap: () {

                    Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) => HomePage(title: 'Home Page')
                      )
                      );
                      //Navigator.pop(context);
                  if(Navigator.canPop(context)){
                  
                  }
                },
              ),
              ListTile(
                leading: new Icon(Icons.cloud_done),
                title: Text('Second Page'),
                onTap: () {

                  Navigator.of(context).pushReplacement(CupertinoPageRoute(
                      builder: (BuildContext context) => ServicePage()
                      )
                      );
                      //Navigator.pop(context);
                  if(Navigator.canPop(context)){
                  
                  }  
                },
              ),
            ],
          ),
        );
  }

  }



