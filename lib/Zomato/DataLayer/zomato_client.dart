import 'dart:convert';
import 'dart:io';

import 'package:first_proj/Zomato/DataLayer/cousine.dart';
import 'package:first_proj/Zomato/DataLayer/location.dart';
import 'package:http/http.dart' as http;

class ZomatoClient {
  var client = new http.Client();

  static final _apiKey = '31bf259a2468d9a9cd077f3fc327b4ba';
  static final domain = 'developers.zomato.com';
  static final locationPath = '/api/v2.1/locations';
  static final detailPath = '/api/v2.1/location_details';

  String responseString;
  List<Location> list = new List<Location>();

  Future<List<Location>> fetchLocations(String query) async {

    var queryParameters = {
      "query": query,
      "count": "10"
    };

    var uri = Uri.https(
        domain, locationPath, queryParameters);

    try {
      var response = await http.get(uri, headers: {
        //HttpHeaders.authorizationHeader: 'Token $token',
        HttpHeaders.contentTypeHeader: 'application/json',
        "user-key": _apiKey,        
      });
      responseString = response.body;
      //print("RESPONSE "+responseString);
      Map<String, dynamic> json = jsonDecode(responseString);

      //print("JSON "+json.toString());
      list = [];
      for (int i = 0; i < json['location_suggestions'].length; i++) {
        list.add(
            new Location(
              json['location_suggestions'][i]['city_name'],
              json['location_suggestions'][i]['title'],
              json['location_suggestions'][i]['country_name'],
              json['location_suggestions'][i]['entity_id'].toString()));
      }
      //list.forEach((e) => {print(e.name)});

      //print("LENGHT "+query.length.toString());

      if(query.length == 0) return null;
      if(query.length == 1) return null;

      return list;

    } catch (err) {
      print('Error fetching locations');
      print(err);
      return null;
    }
  }

  String responseCousinesString;
  List<Cousine> cousinesList = new List<Cousine>();

  Future<List<Cousine>> fetchCousines(String entityId) async{

   /*  List<String> cousinesList = ["American",
    "Sandwich",
    "Burger",
    "Italian",
    "Japanese"]; */

    var queryParameters = {
      "entity_id": entityId,
      "entity_type": "city"
    };

    var uri = Uri.https(
        domain, detailPath, queryParameters);

    try {
      var response = await http.get(uri, headers: {
        //HttpHeaders.authorizationHeader: 'Token $token',
        HttpHeaders.contentTypeHeader: 'application/json',
        "user-key": _apiKey,        
      });
      responseString = response.body;
      //print("RESPONSE "+responseString);
      Map<String, dynamic> json = jsonDecode(responseString);

      print("JSON "+json.toString());
      cousinesList = [];
      for (int i = 0; i < json['top_cuisines'].length; i++) {
        cousinesList.add(
            new Cousine(
              json['top_cuisines'][i].toString()
              ));
      }

      return cousinesList;

    } catch (err) {
      print('Error fetching cousines');
      print(err);
      return null;
    }
  }
}
