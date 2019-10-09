import 'dart:async';

import 'package:first_proj/BLoC/BlocProvider.dart';
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

  int controller2count = 2;

  //
  // Initialize a "Single-Subscription" Stream controller
  //
  final StreamController ctrl = new StreamController();

  //
  // Initialize a "Broadcast" Stream controller of integers
  //
  static final StreamController<int> ctrl2 = new  StreamController<int>.broadcast();
  //
  // Initialize a single listener which filters out the odd numbers and
  // only prints the even numbers
  //
  final StreamSubscription subscription2 = ctrl2.stream
					      .where((value) => (value % 2 == 0))
					      .listen((value) => print('$value'));

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
  void dispose(){
    ctrl.close();
    ctrl2.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

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
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: (){getData();}),
                  RaisedButton(
                  child: new Text("Delete data!",
                      style: new TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: (){deleteData();}),
              ],
              ),
              
              Container(
                margin: EdgeInsets.all(20),
                child: getResp()
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(children: <Widget>[
                      Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(color: Colors.white),
                  ),
                  StreamBuilder(
                      stream: bloc.counter$(),
                      builder: (context, snapshot) => snapshot.hasData
                          ? Text('${snapshot.data}',
                              style:
                                  TextStyle( fontSize: 40))
                          : CircularProgressIndicator()
                          )
                ],)
              ),
              RaisedButton(
                  child: new Text("Start single Stream!",
                      style: new TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: () { startStream(); }),
                  RaisedButton(
                  child: new Text("Start broadcast Stream!",
                      style: new TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.italic,
                          fontSize: 20.0)),
                  onPressed: (){ startBroadcastStream(); }),
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

  startStream(){

  //
  // Initialize a single listener which simply prints the data
  // as soon as it receives it
  //
  try{
    final StreamSubscription subscription = ctrl.stream.listen((data) => print('$data'));
    //
    // We here add the data that will flow inside the stream
    //
    ctrl.sink.add('my name');
    ctrl.sink.add(1234);
    ctrl.sink.add({'a': 'element A', 'b': 'element B'});
    ctrl.sink.add(123.45);
  }
  catch (err){
    print('Error '+err.toString());
  }
  
  //
  // We release the StreamController
  //
  //ctrl.close();
  }

  startBroadcastStream() async{ 
      
  //
  // We here add the data that will flow inside the stream
  //
  	ctrl2.sink.add(controller2count);

    controller2count += 2;
  
  //
  // We release the StreamController
  //
  //ctrl2.close();
  }
}
