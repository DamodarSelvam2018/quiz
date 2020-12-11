import 'dart:io';

import 'package:flutter/material.dart';

import 'package:frideos/frideos.dart';
import 'package:MannersMatters/homepage.dart';
import 'package:MannersMatters/landing_page.dart';

import 'models/appstate.dart';
import 'quiz_brain.dart';
import 'models/theme.dart';

class SummaryPage extends StatelessWidget {
  SummaryPage({this.stats});

  var stats;

  List<Widget> _buildQuestions() {
    final widgets = List<Widget>();
    if (stats[0] != 0) {
      print('${stats[0]} gold stars');
      widgets
        ..add(
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 32,
                //color: Colors.indigo[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Gold Star(',
                      //style: correctsHeaderStyle,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellowAccent,
                    ),
                    Text(
                      '): ${stats[0]}',
                      //style: correctsHeaderStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }

    if (stats[1] != 0) {
      print('${stats[1]} silver stars');
      widgets
        ..add(
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 32,
                //color: Colors.indigo[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Silver Star(',
                      //style: correctsHeaderStyle,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.grey,
                    ),
                    Text(
                      '): ${stats[1]}',
                      //style: correctsHeaderStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }

    if (stats[2] != 0) {
      print('${stats[2]} bronze stars');
      widgets
        ..add(
          Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8.0),
                height: 32,
                //color: Colors.indigo[700],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Bronze Star(',
                      //style: correctsHeaderStyle,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                    ),
                    Text(
                      '): ${stats[2]}',
                      //style: correctsHeaderStyle,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final appState = AppStateProvider.of<AppState>(context);

    final List<Widget> widgets = _buildQuestions()
      ..add(Container(
        height: 24,
      ))
      ..add(Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 90,
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
          ),
          Container(
            height: 50,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: 90,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: const Text('Quit'),
                onPressed: () => exit(0),
              ),
            ),
          ),
        ],
      ));

    var expansionTileStyle =
        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

    return Scaffold(
      appBar: AppBar(title: Text('Manners Matter'), actions: <Widget>[]),
      body: Container(
        margin: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Container(
          child: ListView(
            shrinkWrap: true,
            children: widgets,
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
