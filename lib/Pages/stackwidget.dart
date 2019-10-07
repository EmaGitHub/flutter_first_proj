import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class StackWidget extends StatefulWidget {
  const StackWidget({Key key}) : super(key: key);

  @override
  _StateWidgetState createState() => new _StateWidgetState();
}

class _StateWidgetState extends State<StackWidget> {
  User user = new User('Username', 'Userlastname');
  final items = List<String>.generate(20, (i) => "Item ${i + 1} swipe To delete Me");

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getNavigationView() {
    switch (_selectedIndex) {
      case 0:
        return _buildUser('assets/images/avatar_circle.png', user.name);
      case 1:
        return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Dismissible(
                // Each Dismissible must contain a Key. Keys allow Flutter to
                // uniquely identify widgets.
                key: Key(item),
                // Provide a function that tells the app
                // what to do after an item has been swiped away.
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    items.removeAt(index);
                  });

                  // Then show a snackbar.
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("$item dismissed"),
                    duration: Duration(milliseconds: 1000),
                  ));
                },
                // Show a red background as the item is swiped away.
                background: Container(color: Colors.red),
                child: ListTile(title: Text('$item')),
              );
            },
          );

      case 2:
        return _buildStack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: 20),
              height: 500,
              child: getNavigationView()),
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              title: Text('User'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('List'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.line_style),
              title: Text('Stack'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ));
  }
}

Widget _buildUser(pic, name) => Stack(
      alignment: const Alignment(0, 0.7),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(pic),
          radius: 150,
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

Widget _buildStack() => Stack(
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
                color: Colors.yellowAccent, height: 200.0, width: 200.0)),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              color: Colors.greenAccent,
              height: 100.0,
              width: 100.0,
            )),
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
