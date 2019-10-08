import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component
import 'package:http/http.dart' as http;
import 'dart:convert'; //it allows us to convert our json to a list

import 'package:connectivity/connectivity.dart';
import 'package:toast/toast.dart';

class RequestPage extends StatefulWidget {
  @override
  _RequestPageState createState() => new _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List data;

  @override
  initState() {
    super.initState();
  }

  void showToast(String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
  //this async func will get data from the internet
  //when our func is done we return a string
  void getData() async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      makeHttpReq();
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      makeHttpReq();
    }
    else showToast('You are offline. Please enable connection', duration: 2, gravity: Toast.BOTTOM);
  }

  void deleteData(){

    setState(() {
      
      data = [];
    });
  }

  void makeHttpReq() async{

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                RaisedButton(
                  child: new Text("Get data!",
                      style: new TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: getData),
                  RaisedButton(
                  child: new Text("Delete data!",
                      style: new TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: deleteData),
              ],
              ),
              
              Container(
                margin: EdgeInsets.all(20),
                child: getResp(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getResp(){

    if (data != null) return Text('' + data.toString());
    else return Text('');
  }
}
