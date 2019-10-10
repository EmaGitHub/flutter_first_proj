import 'package:first_proj/BLoC/counterBLoC.dart';
import 'package:first_proj/Pages/animations-list.dart';
import 'package:first_proj/Pages/camera.dart';
import 'package:first_proj/Pages/flare.dart';
import 'package:first_proj/Pages/layoutset.dart';
import 'package:first_proj/Pages/request.dart';
import 'package:first_proj/Pages/stackwidget.dart';
import 'package:first_proj/Pages/homescreen.dart';
import 'package:first_proj/examples/fancy_background.dart';
import 'package:first_proj/examples/particle_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'BLoC/BlocProvider.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

void main() {
  final bloc = CounterBloc();
  runApp(MyApp(bloc));
}
//Una volta eseguito, il compilatore creerà un’istanza della classe MyApp e la passerà alla funzione runApp che eseguirà l’applicazione

class MyApp extends StatelessWidget {
  final CounterBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        bloc: bloc,
        child: MaterialApp(
          title: 'Flutter App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:
              HomePage(title: 'Home Page'), //OrangeContainer(text: 'Lesson 10')
        )
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
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);
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
        body: Stack(children: <Widget>[
          ParticleBackgroundApp(),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      child: Text(
                        'Animations List',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => AnimationsPage()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'Reactive Prog, stream, BLoC',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestPage()
                              ));
                    },
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(color: Colors.white),
                  ),
                  StreamBuilder(
                      stream: bloc.counter$(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Text('${snapshot.data}',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 40))
                          : CircularProgressIndicator()
                          ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        onPressed: () => bloc.decrement().add(null),
                        tooltip: 'Decrement',
                        child: Icon(Icons.remove),
                      ),
                      FloatingActionButton(
                        heroTag: "btn2",
                        onPressed: () => bloc.increment().add(null),
                        tooltip: 'Increment',
                        child: Icon(Icons.add),
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
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      child: Text(
                        'Navbar',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StackWidget()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      child: Text(
                        'Camera',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => CameraPage()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(
                        'Flare',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => FlarePage()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(
                        'Animations Examples Demo',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => Homescreen()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
