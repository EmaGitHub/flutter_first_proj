import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class StackWidget extends StatefulWidget {

  const StackWidget({Key key}) : super(key: key);

  @override
  _StateWidgetState createState() => new _StateWidgetState();
}

  class _StateWidgetState extends State<StackWidget>{

    User user = new User('Username', 'Userlastname');

    int _selectedIndex = 1;
    static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    static const List<Widget> _widgetOptions = <Widget>[
      Text(
        'Index 0: Home',
        style: optionStyle,
      ),
      Text(
        'Index 1: Business',
        style: optionStyle,
      ),
      Text(
        'Index 2: School',
        style: optionStyle,
      ),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: 
        SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 20),
                child:
                    _buildStack('assets/images/avatar_circle.png', user.name)),
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
          ],
        )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        )
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

class User {
  String name;
  String surname;
  var articles = [];

  //. . .
  User(this.name, this.surname);

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
