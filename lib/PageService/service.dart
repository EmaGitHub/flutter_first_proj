import 'package:first_proj/BLoC/BlocProvider.dart';
import 'package:first_proj/Objects/drawer.dart';
import 'package:first_proj/examples/fancy_background.dart';
import 'package:first_proj/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; //Attraverso questa libreria, Flutter dispone di tutte le funzionalità, colori e widget, noti come material component

class ServicePage extends StatefulWidget {

  @override
  _ServicePageState createState() => new _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Service Page'),
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Center(

        ),
      ),
    );
  }
}
