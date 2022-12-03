import 'package:flutter/material.dart';


class History extends StatelessWidget {
  const History({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
        value: DatabaseService().history,
        child: Scaffold(
          body: HistoryTile(),
        ));
  }
}