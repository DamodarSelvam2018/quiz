import 'package:flutter/material.dart';
import 'package:quizzler/summary_page.dart';
import 'free_question.dart';
import 'homepage.dart';
import 'quiz_brain.dart';
import 'screens/settings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

// AppBar actions
enum ActionPage { info, settings, help }

QuizBrain quizBrain = QuizBrain();

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
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
        body: Align(
          alignment: Alignment.center,
          child: new ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ButtonTheme(
                minWidth: 200.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)),
                child: RaisedButton(
                  elevation: 5.0,
                  hoverColor: Colors.green,
                  color: Colors.amber,
                  child: Text(
                    "Play",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new FQPage()));
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
