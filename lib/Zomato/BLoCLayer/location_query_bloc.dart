import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:first_proj/Zomato/BLoCLayer/bloc.dart';
import 'package:first_proj/Zomato/DataLayer/location.dart';
import 'package:first_proj/Zomato/DataLayer/zomato_client.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class LocationQueryBloc implements Bloc {
  
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 
     List<Location> results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }

  void showToast(BuildContext context, String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }

testConnectionAndFetch(BuildContext context, LocationQueryBloc bloc, String query) async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      bloc.submitQuery(query);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      bloc.submitQuery(query);
    }
    else showToast(context, 'You are offline. Please enable connection', duration: 2, gravity: Toast.CENTER);
  }

}