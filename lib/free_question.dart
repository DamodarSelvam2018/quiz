import 'package:flutter/material.dart';
import 'package:MannersMatters/homepage.dart';
import 'package:MannersMatters/landing_page.dart';
import 'package:MannersMatters/summary_page.dart';
import 'quiz_brain.dart';
import 'screens/settings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

// AppBar actions
enum ActionPage { info, settings, help }

class FQPage extends StatefulWidget {
  @override
  _FQPageState createState() => _FQPageState();
}

class _FQPageState extends State<FQPage> {
  @override
  void initState() {
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  String _radioValue;
  String enteredText;
  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    var expansionTileStyle =
        TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic);

    return Scaffold(
        appBar: AppBar(title: Text('Manners Matter'), actions: <Widget>[
          PopupMenuButton(
            onSelected: (value) {
              var page;
              switch (value) {
                case ActionPage.settings:
                  page = SettingsPage();
                  break;
                default:
                  break;
              }
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => page),
              );
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: ActionPage.settings,
                  child: Text('Settings'),
                ),
              ];
            },
          ),
        ]),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'What is your name ?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Your Name Here',
                            hintText: 'Enter Your Name Here',
                          ),
                          autofocus: false,
                          onChanged: (newText) {
                            enteredText = newText;
                          },
                        ))
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        // margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Are you a boy or a girl?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Radio(
                      value: 'Girl',
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Girl',
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Radio(
                      value: 'Boy',
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    new Text(
                      'Boy',
                      style: new TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.all(10),
                        // margin: const EdgeInsets.only(top: 50),
                        child: Text(
                          'Are you ready to play the game?',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ],
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        textColor: Colors.white,
                        color: Colors.grey,
                        child: Text('No'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => new LandingPage()));
                        },
                      ),
                    ),
                    Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.green)),
                        textColor: Colors.white,
                        color: Colors.amber,
                        child: Text('Yes'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      new HomePage(enteredText)));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )));
//      body: Container(
//          margin: EdgeInsets.all(20),
//          alignment: Alignment.center,
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: <Widget>[
//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  Align(
//                    alignment: Alignment.topLeft,
//                    child: Text(
//                      'What is your Name?',
//                      style: TextStyle(
//                        //color: Colors.grey,
//                        fontSize: 18.0,
//                        fontWeight: FontWeight.bold,
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.start,
//                children: [
//                  Text(
//                    'Are you a boy or a girl?',
//                    style: TextStyle(
//                      //color: Colors.grey,
//                      fontSize: 18.0,
//                      fontWeight: FontWeight.bold,
//                    ),
//                  ),
//                ],
//              ),
//              Row(
//                children: <Widget>[
//                  new ButtonTheme(
//                    minWidth: 200.0,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
//                        side: BorderSide(color: Colors.green)),
//                    child: RaisedButton(
//                      //elevation: 5.0,
//                      hoverColor: Colors.green,
//                      color: Colors.amber,
//                      child: Text(
//                        "No",
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.bold),
//                      ),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            new MaterialPageRoute(
//                                builder: (context) => new LandingPage()));
//                      },
//                    ),
//                  ),
//                  new ButtonTheme(
//                    minWidth: 200.0,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(18.0),
//                        side: BorderSide(color: Colors.green)),
//                    child: RaisedButton(
//                      //elevation: 5.0,
//                      hoverColor: Colors.green,
//                      color: Colors.amber,
//                      child: Text(
//                        "Yes",
//                        style: TextStyle(
//                            color: Colors.white, fontWeight: FontWeight.bold),
//                      ),
//                      onPressed: () {
//                        Navigator.push(
//                            context,
//                            new MaterialPageRoute(
//                                builder: (context) => new HomePage()));
//                      },
//                    ),
//                  ),
//                ],
//              ),
////              ButtonTheme(
////                //minWidth: 200.0,
////                shape: RoundedRectangleBorder(
////                    borderRadius: BorderRadius.circular(18.0),
////                    side: BorderSide(color: Colors.green)),
////                child: RaisedButton(
////                  elevation: 5.0,
////                  hoverColor: Colors.green,
////                  color: Colors.amber,
////                  child: Text(
////                    "Yes",
////                    style: TextStyle(
////                        color: Colors.white, fontWeight: FontWeight.bold),
////                  ),
////                  onPressed: () {
////                    Navigator.push(
////                        context,
////                        new MaterialPageRoute(
////                            builder: (context) => new HomePage()));
////                  },
////                ),
////              ),
//            ],
//          )), // This trailing comma makes auto-formatting nicer for build methods.
    // );
  }
}
