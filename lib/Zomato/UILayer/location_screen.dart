import 'package:first_proj/Zomato/BLoCLayer/bloc_provider.dart';
import 'package:first_proj/Zomato/BLoCLayer/location_bloc.dart';
import 'package:first_proj/Zomato/BLoCLayer/location_query_bloc.dart';
import 'package:first_proj/Zomato/DataLayer/location.dart';
import 'package:first_proj/Zomato/UILayer/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool spinnerVisible;

  @override
  void initState() {
    spinnerVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    final bloc = LocationQueryBloc();

    // 2
    return BlocProviderZomato<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Where do you want to eat?')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a location'),

                  // 3
                  onChanged: (query) => {
                        //this.makeSpinnerVisible(),
                        bloc.testConnectionAndFetch(context, bloc, query)
                      }),
            ),
            // 4
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {
        // 1
        final results = snapshot.data;

        if (results == null) {
          return Center(child: Text('Enter a location'));
        }

        if (results.isEmpty) {
          //this.makeSpinnerInvisible();
          return Center(child: Text('No Results'));
        } else {

          print("RESULTs: ");
          results.forEach((e) => {print(e.name)});
          return _buildSearchResults(results);
        }
      },
    );
  }

  Widget _buildSearchResults(List<Location> results) {
    final locBloc = LocationBloc();
    // 2
    return BlocProviderZomato<LocationBloc>(
        bloc: locBloc,
        child: ListView.separated(
          itemCount: results.length,
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemBuilder: (context, index) {
            final location = results[index];
            return ListTile(
              title: Text(location.name),
              onTap: () {
                locBloc.selectLocation(location);
                // 3
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => DetailScreen(bloc: locBloc)));
              },
            );
          },
        ));
  }

  void makeSpinnerVisible() {
    setState(() {
      spinnerVisible = true;
    });
  }

  void makeSpinnerInvisible() {
    setState(() {
      spinnerVisible = false;
    });
  }
}
