import 'package:flutter/material.dart';
import 'dart:io';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'quiz_brain.dart';
import 'themeColors.dart';

QuizBrain quizBrain = QuizBrain();
ThemeColors themeColors = ThemeColors();

void main() => runApp(Quizzler());

void playsound() {
  final player = AudioCache();
  player.play('note7.wav');
}

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manners Matter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            'Manners matters',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  //List<Icon> scoreKeeper = [];
  String myChoice = '';
  String buildWidg;

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
      color: themeColors.burlyWood[900],
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              getQuestionNo(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
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
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(0),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(1),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          flex: 2,
          child: createChoiceButton(2),
        ),
      ],
    );
  }
}
