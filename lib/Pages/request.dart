import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class RequestPage extends StatefulWidget {

  @override
  _RequestPageState createState() => new _RequestPageState();

}

class _RequestPageState extends State<RequestPage>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Req Page'),
      ),
      body: Column(children: <Widget>[
        
      ],),
    );
  }


}