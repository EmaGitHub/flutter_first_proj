import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert'; //it allows us to convert our json to a list

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => new _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List data = [];

  @override
  initState() {
    super.initState();
  }

  //this async func will get data from the internet
  //when our func is done we return a string
  Future<String> getData() async {
    //we have to wait to get the data so we use 'await'
    http.Response response = await http.get(
        //Uri.encodeFull removes all the dashes or extra characters present in our Uri
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {
          //if your api require key then pass your key here as well e.g "key": "my-long-key"
          "Accept": "application/json"
        });

    setState(() {
      data = jsonDecode(response.body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Req Page'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  child: new Text("Get data!",
                      style: new TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: getData),
              Container(
                margin: EdgeInsets.all(20),
                child: Text('' + data.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
