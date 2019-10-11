import 'package:first_proj/Zomato/BLoCLayer/location_bloc.dart';
import 'package:first_proj/Zomato/DataLayer/cousine.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final LocationBloc bloc;

  const DetailScreen({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 1
    return StreamBuilder(
        stream: this.bloc.cousinesStream,
        builder: (context, snapshot) {
          final results = snapshot.data;

          return Scaffold(
            appBar: AppBar(
              title: Text('Cousines available'),
            ),
            body: bodyContent(results),
          );
        });
  }

  Widget bodyContent(List<Cousine> results) {
    if (results == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
          ],
        ),
      );
    } else
      return ListView.separated(
        itemCount: results.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) {
          final cousine = results[index];
          return ListTile(
            title: Text("-" + cousine.name),
          );
        },
      );
  }
}
