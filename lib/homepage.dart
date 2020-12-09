import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'screens/settings.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';

// AppBar actions
enum ActionPage { info, settings, help }

QuizBrain quizBrain = QuizBrain();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  void playsound() {
    final player = AudioCache();
    player.play('note7.wav');
  }

//  String myChoice = '';
//  String buildWidg;

  void checkAnswer(String userPickedAnswer) {
    //bool correctAnswer = quizBrain.getCorrectAnswer();
    String choice = quizBrain.checkAnswer(userPickedAnswer);
    setState(() {
      if (choice == "gold" && quizBrain.getTotalQuestionsAsked() > 1) {
        Alert(
            context: context,
            title: 'Yay!',
            desc: 'You\'ve Scored a gold',
            content: Column(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                )
              ],
            ),
            buttons: [
//                DialogButton(
//                  child: Text("Prev"),
//                  onPressed: () {
//                    quizBrain.prevQuestion();
//                    Navigator.pop(context);
//                  },
//                ),
              DialogButton(
                child: Text("Next"),
                onPressed: () {
                  //quizBrain.nextQuestion();
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else if (choice == "silver" && quizBrain.getTotalQuestionsAsked() > 1) {
        Alert(
            context: context,
            title: 'Wow!',
            desc: 'You\'ve Scored a Silver',
            content: Column(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.grey,
                )
              ],
            ),
            buttons: [
              DialogButton(
                child: Text("Next"),
                onPressed: () {
                  //quizBrain.nextQuestion();
                  Navigator.pop(context);
                },
              )
            ]).show();
      } else if (choice == "bronze" && quizBrain.getTotalQuestionsAsked() > 1) {
        Alert(
            context: context,
            title: 'Good!',
            desc: 'You\'ve Scored a Bronze',
            content: Column(
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Colors.orange,
                )
              ],
            ),
            buttons: [
              DialogButton(
                child: Text("Next"),
                onPressed: () {
                  //quizBrain.nextQuestion();
                  Navigator.pop(context);
                },
              )
            ]).show();
      }
      //sleep(const Duration(seconds: 5));
      if (quizBrain.getTotalQuestionsAsked() <=
          quizBrain.questionBankLength()) {
        quizBrain.nextQuestion();
      } else {
        Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
            buttons: [
              DialogButton(
                child: Text("Home"),
                onPressed: () => Navigator.pop(context),
              )
            ]).show();
        quizBrain.reset();
      }
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
//      if (quizBrain.isFinished() == true) {
//        //TODO Step 4 Part A - show an alert using rFlutter_alert,
//
//        //This is the code for the basic alert from the docs for rFlutter Alert:
//        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();
//
//        //Modified for our purposes:
//        Alert(
//            context: context,
//            title: 'Finished!',
//            desc: 'You\'ve reached the end of the quiz.',
//            buttons: [
//              DialogButton(
//                child: Text("Home"),
//                onPressed: () {
//                  //quizBrain.nextQuestion();
//                  quizBrain.reset();
//
//                  Navigator.pop(context);
//                },
//              )
//            ]).show();
//
//        //TODO Step 4 Part C - reset the questionNumber,
//        quizBrain.reset();
//
//        //TODO Step 4 Part D - empty out the scoreKeeper.
//        // scoreKeeper = [];
//      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
//      else {
//        if (userPickedAnswer == quizBrain.getGoldAnswer()) {
////          myChoice = "gold";
//          Alert(
//              context: context,
//              title: 'Yay!',
//              desc: 'You\'ve Scored a gold',
//              content: Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.star,
//                    color: Colors.yellowAccent,
//                  )
//                ],
//              ),
//              buttons: [
////                DialogButton(
////                  child: Text("Prev"),
////                  onPressed: () {
////                    quizBrain.prevQuestion();
////                    Navigator.pop(context);
////                  },
////                ),
//                DialogButton(
//                  child: Text("Next"),
//                  onPressed: () {
//                    //quizBrain.nextQuestion();
//                    Navigator.pop(context);
//                  },
//                )
//              ]).show();
//        } else if (userPickedAnswer == quizBrain.getSilverAnswer()) {
////          myChoice = "silver";
//          Alert(
//              context: context,
//              title: 'Wow!',
//              desc: 'You\'ve Scored a Silver',
//              content: Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.star,
//                    color: Colors.grey,
//                  )
//                ],
//              ),
//              buttons: [
//                DialogButton(
//                  child: Text("Next"),
//                  onPressed: () {
//                    //quizBrain.nextQuestion();
//                    Navigator.pop(context);
//                  },
//                )
//              ]).show();
//        } else if (userPickedAnswer == quizBrain.getBronzeAnswer()) {
////          myChoice = "bronze";
//          Alert(
//              context: context,
//              title: 'Good!',
//              desc: 'You\'ve Scored a Bronze',
//              content: Column(
//                children: <Widget>[
//                  Icon(
//                    Icons.star,
//                    color: Colors.orange,
//                  )
//                ],
//              ),
//              buttons: [
//                DialogButton(
//                  child: Text("Next"),
//                  onPressed: () {
//                    //quizBrain.nextQuestion();
//                    Navigator.pop(context);
//                  },
//                )
//              ]).show();
//        }
//        quizBrain.nextQuestion();
//      }
    });
  }

  String getQuestionNo() {
    return 'Question: ' + quizBrain.getTotalQuestionsAsked().toString();
  }

  FlatButton createChoiceButton(int btnNo) {
    return FlatButton(
      onPressed: () {
        setState(() {
          playsound();
          checkAnswer(quizBrain.getAnswers(btnNo));
        });
      },
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
          side: BorderSide(color: Colors.grey)),
      padding: EdgeInsets.all(10.0),

      //padding: new EdgeInsets.only(left: 70.0),
      color: Colors.white,
      child: Text(
        quizBrain.getChoice(btnNo),
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
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

      body: Container(
          margin: EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '', // 'Hi,_______',
                      style: TextStyle(
                        //color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getQuestionNo(),
                    style: TextStyle(
                      //color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ), //Score Data here
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestionText(),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold
                              //color: Colors.grey,
                              ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: createChoiceButton(0),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: createChoiceButton(1),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                flex: 3,
                child: createChoiceButton(2),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      '',
                      style: TextStyle(
                        //color: Colors.grey,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
