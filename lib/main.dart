import 'package:first_proj/Pages/animations.dart';
import 'package:first_proj/Pages/layoutset.dart';
import 'package:first_proj/Pages/list.dart';
import 'package:first_proj/Pages/request.dart';
import 'package:first_proj/Pages/stackwidget.dart';
import 'package:first_proj/Pages/homescreen.dart';
import 'package:first_proj/examples/fancy_background.dart';
import 'package:first_proj/examples/particle_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

void main() => runApp(
    MyApp()); //Una volta eseguito, il compilatore creerà un’istanza della classe MyApp e la passerà alla funzione runApp che eseguirà l’applicazione

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'), //OrangeContainer(text: 'Lesson 10')
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  String mainProfilePicture =
      "https://randomuser.me/api/portraits/women/44.jpg";
  String otherProfilePicture =
      "https://randomuser.me/api/portraits/women/47.jpg";

  void _switchUser() {
    String backupString = mainProfilePicture;
    this.setState(() {
      mainProfilePicture = otherProfilePicture;
      otherProfilePicture = backupString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: new Drawer(
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
              /* UserAccountsDrawerHeader(
              accountName: Text("Ashish Rawat"),
              accountEmail: Text("ashishrawat2911@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor:
                    Theme.of(context).platform == TargetPlatform.iOS
                        ? Colors.blue
                        : Colors.white,
                child: 
                Text(
                  "A",
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ), */
              ListTile(
                leading: new Icon(Icons.airline_seat_legroom_normal),
                title: Text('Animations Page'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => AnimationsPage()));
                },
              ),
              ListTile(
                leading: new Icon(Icons.cloud_done),
                title: Text('Stack widget Page'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => StackWidget()));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[

            ParticleBackgroundApp(),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      'HTTP Request PAGE',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RequestPage()));
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                        elevation: 20,
                        onPressed: () {
                          print('Clicked');
                          _decrementCounter();
                        },
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
                        elevation: 20,
                        onPressed: () {
                          _incrementCounter();
                        },
                      )
                    ],
                  ),
                  RaisedButton(
                    child: Text(
                      'Layout settings',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LayoutSet(text: 'Detail')),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(
                        'Stack Widget & Navbar',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => StackWidget()),
                        );
                      },
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(
                        'Animations',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AnimationsPage()),
                        );
                      },
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: RaisedButton(
                      child: Text(
                        'List View',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => ListPage()),
                        );
                      },
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: RaisedButton(
                      child: Text(
                        'Animations Examples Demo',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => Homescreen()),
                        );
                      },
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
        ]
      )
    );
  }
}
