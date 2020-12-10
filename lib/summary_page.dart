import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';
import 'package:quizzler/homepage.dart';
import 'package:quizzler/landing_page.dart';

import 'models/appstate.dart';
import 'quiz_brain.dart';
import 'models/theme.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({this.stats});

  var stats;

  List<Widget> _buildQuestions() {
    var index = 0;

    final widgets = List<Widget>();

//    if (stats[0] != 0) {
//      print('${stats[0]} gold stars');
//      widgets
//        ..add(
//          Container(
//            padding: const EdgeInsets.all(8.0),
//            height: 32,
//            color: Colors.indigo[700],
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  'GOLD: ${stats[0]}',
//                  //style: correctsHeaderStyle,
//                ),
//              ],
//            ),
//          ),
//        );
//    }
//
//    if (stats[1] != 0) {
//      print('${stats[1]} silver stars');
//      widgets
//        ..add(
//          Container(
//            padding: const EdgeInsets.all(8.0),
//            height: 32,
//            color: Colors.indigo[700],
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  'Silver: ${stats[1]}',
//                ),
//              ],
//            ),
//          ),
//        );
//    }
//
//    if (stats[2] != 0) {
//      print('${stats[2]} bronze stars');
//      widgets
//        ..add(
//          Container(
//            padding: const EdgeInsets.all(8.0),
//            height: 32,
//            color: Colors.indigo[700],
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.start,
//              children: <Widget>[
//                Text(
//                  'Bronze: ${stats[2]}',
//                  // style: notAnsweredHeaderStyle,
//                ),
//              ],
//            ),
//          ),
//        );
//    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    final List<Widget> widgets = List<Widget>(); //_buildQuestions()
    if (stats[0] != 0) {
      print('${stats[0]} gold stars');
      widgets
        ..add(
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 32,
            color: Colors.indigo[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'GOLD: ${stats[0]}',
                  //style: correctsHeaderStyle,
                ),
              ],
            ),
          ),
        );
    }

    if (stats[1] != 0) {
      print('${stats[1]} silver stars');
      widgets
        ..add(
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 32,
            color: Colors.indigo[700],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Silver: ${stats[1]}',
                ),
              ],
            ),
          ),
        );
    }

    if (stats[2] != 0) {
      print('${stats[2]} bronze stars');
      widgets
        ..add(
          Container(
            padding: const EdgeInsets.all(8.0),
            height: 80,
            color: Colors.indigo[700],
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Bronze: ${stats[2]}',
                  style: TextStyle(fontSize: 25),
                  // style: notAnsweredHeaderStyle,
                ),
              ],
            ),
          ),
        );
    }
    widgets
      ..add(Container(
        height: 24,
      ))
      ..add(Container(
        width: 90,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: RaisedButton(
            child: const Text('Home'),
            //onPressed: () => appState.tabController.value = AppTab.main,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LandingPage()));
            },
          ),
        ),
      ));

//    return Row(
//      children: widgets,
//    );

    var expansionTileStyle =
        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

    return Scaffold(
      appBar: AppBar(title: Text('Manners Matter'), actions: <Widget>[]),

      body: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.end, children: widgets),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
