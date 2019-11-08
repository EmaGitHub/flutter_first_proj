import 'package:first_proj/BLoC/counterBLoC.dart';
import 'package:first_proj/Objects/drawer.dart';
import 'package:first_proj/Pages/animations-list.dart';
import 'package:first_proj/Pages/camera.dart';
import 'package:first_proj/Pages/flare.dart';
import 'package:first_proj/Pages/layoutset.dart';
import 'package:first_proj/Pages/request.dart';
import 'package:first_proj/Pages/stackwidget.dart';
import 'package:first_proj/Pages/webview.dart';
import 'package:first_proj/Zomato/UILayer/location_screen.dart';
import 'package:first_proj/animations/FadeIn.dart';
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
        drawer: MyDrawer(),
        body: Stack(children: <Widget>[
          ParticleBackgroundApp(),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 20, bottom: 30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FadeIn( 2, 
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
                  )),
                  FadeIn(4, 
                  RaisedButton(
                    child: Text(
                      'Reactive Prog, stream, BLoC',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => RequestPage()
                              ));
                    },
                    //padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  )
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
                  FadeIn(5,
                  RaisedButton(
                    child: Text(
                      'Zomato eating app',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LocationScreen()),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  )
                  ),
                  FadeIn(2,
                  RaisedButton(
                    child: Text(
                      'Layout settings',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LayoutSet(text: 'Layout Settings')),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black26, width: 4),
                        borderRadius: BorderRadius.circular(10)),
                  )
                  ),
                  FadeIn(3,
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: RaisedButton(
                      child: Text(
                        'Navbar-Stack',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => StackWidget()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                  ),
                  FadeIn(4,
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
                  )
                  ),
                  FadeIn(1,
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
                  )
                  ),
                  FadeIn(4,
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: RaisedButton(
                      child: Text(
                        'WebView',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(builder: (context) => WebViewPage()),
                        );
                      },
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black26, width: 4),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}
