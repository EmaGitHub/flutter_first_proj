import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class StackWidget extends StatelessWidget {

  const StackWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    User user = new User('Username', 'Userlastname');

    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
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
              child: _buildStack('assets/images/avatar_circle.png', user.name) 
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
