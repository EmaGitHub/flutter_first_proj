import 'dart:async';

import 'package:first_proj/Zomato/BLoCLayer/bloc.dart';
import 'package:first_proj/Zomato/DataLayer/location.dart';
import 'package:first_proj/Zomato/DataLayer/zomato_client.dart';

class LocationBloc implements Bloc {

  Location _location;
  Location get selectedLocation => _location;
  ZomatoClient client = ZomatoClient();

  // 1
  final _cousinesController = StreamController<List<String>>();

  // 2
  Stream<List<String>> get cousinesStream => _cousinesController.stream;

  // 3
  void selectLocation(Location location) async {
    _location = location;
    location.toString();
    final result = await client.fetchCousines();
    _cousinesController.sink.add(result);
  }

  // 4
  @override
  void dispose() {
    _cousinesController.close();
  }
} 