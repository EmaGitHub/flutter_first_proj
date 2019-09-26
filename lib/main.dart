import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component
import 'dart:math'; //LIbreria per funzioni matematiche

void main() => runApp(
    MyApp()); //Una volta eseguito, il compilatore creerà un’istanza della classe MyApp e la passerà alla funzione runApp che eseguirà l’applicazione

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Home Page'), //OrangeContainer(text: 'Lesson 10')
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
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
                      builder: (context) => OrangeContainer(text: 'Detail')),
                );
              },
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26, width: 4),
                  borderRadius: BorderRadius.circular(10)),
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
                    print('Clicked');
                    _incrementCounter();
                  },
                )
              ],
            ),
            RaisedButton(
              child: Text(
                'Stack Widget',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.black26, width: 4),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          //we will add our widgets here.
          Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              child: Stack(
                alignment: Alignment.centerRight,
                children: <Widget>[
                  // Max Size
                  Container(
                    color: Colors.orange,
                    height: 300,
                    width: 300,
                  ),
                  Positioned(
                      right: 80.0,
                      child: Container(
                          color: Colors.yellowAccent,
                          height: 200.0,
                          width: 200.0)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        color: Colors.greenAccent,
                        height: 100.0,
                        width: 100.0,
                      )),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
              child: _buildStack('assets/images/avatar_circle.png', 'Username')
          )
        ],
      )),
    );
  }
}

Widget _buildStack(pic, name) => Stack(
    alignment: const Alignment(0, 0.7),
    children: [
      CircleAvatar(
        backgroundImage: AssetImage(pic),
        radius: 100,
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.black45,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ],
  );

class OrangeContainer extends StatelessWidget {
  const OrangeContainer({Key key, this.text}) : super(key: key);
  final String text;

  static const _PATH = "assets/images";
  static const _PIC01 = "$_PATH/apps.png";
  static const _PIC02 = "$_PATH/logged_user.png";
  static const _GIF01 = "assets/gifs/FlappingFlagTheory.gif";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(this.text),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                  margin:
                      EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 0),
                  child: Text(
                    "Definition of a TextStyle with basic parameters",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'FFF_Tusj',
                        fontSize: 25,
                        color: Colors.lightBlue[700],
                        shadows: [
                          /* Shadow(
                            color: Colors.black,
                            offset: Offset(1, 3),
                            blurRadius: 2), */
                          /* Shadow(
                            color: Colors.cyan,
                            offset: Offset(3, 1),
                            blurRadius: 2) */
                        ]),
                  )),
              Container(
                constraints: BoxConstraints.expand(height: 300),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage(_GIF01),
                  fit: BoxFit.cover,
                  height: 200,
                  width: 300,
                ),
              ),
              Container(
                width: 300.0,
                height: 50.0,
                color: Colors.teal,
                alignment: Alignment.center,
                child: Text("Container width = 300 , height = 50"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 300),
                alignment: Alignment.center,
                child: Image.asset(
                  _PIC01,
                  fit: BoxFit.cover,
                  color: Colors.purple,
                  colorBlendMode: BlendMode.colorDodge,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                color: Colors.orange,
                child: Text(
                    "\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\nBasic Container\n"),
              ),
              Container(
                color: Colors.yellow,
                margin: EdgeInsets.only(
                    left: 40.0, right: 40.0, top: 10, bottom: 10),
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20, bottom: 20),
                child: Container(
                  color: Colors.orangeAccent[200],
                  child: Text("Container with margin and padding"),
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 100.0, width: 200),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(20),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    color: Colors.red),
                child: Text("Container with ShapeDecoration"),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                margin: EdgeInsets.only(left: 20, right: 20),
                constraints: BoxConstraints.expand(height: 200),
                alignment: Alignment.centerLeft,
                color: Colors.lightGreenAccent[700],
                transform: Matrix4.rotationY(pi / 5)..rotateX(pi / 5),
                child: Text("Transform"),
              ),
              Container(
                constraints: BoxConstraints.expand(height: 50),
                margin: EdgeInsets.only(bottom: 15),
                child: Image.asset(
                  _PIC02,
                  repeat: ImageRepeat.repeatX,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ));
  }
}

class Author {
  String name;
  String surname;
  var articles = [];

  //. . .
  Author(this.name, this.surname);

  // . . .
  @override
  String toString() => 'Author: $name $surname';

  // . . .
  void addArticle(String article) {
    articles.add(article);
  }

  // . . .
  void showArticles() {
    articles.forEach((article) => print(article));
  }

  // . . .
  countArticles() => articles.length;
}
