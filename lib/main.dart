import 'package:flutter/material.dart';

//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manners Matter',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
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

    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz. If so,
      //On the next line, you can also use if (quizBrain.isFinished()) {}, it does the same thing.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        Alert(
            context: context,
            title: 'Finished!',
            desc: 'You\'ve reached the end of the quiz.',
            buttons: [
              DialogButton(
                child: Text("Home"),
                onPressed: () {
                  //quizBrain.nextQuestion();
                  quizBrain.reset();
                  Navigator.pop(context);
                },
              )
            ]).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        // scoreKeeper = [];
      }

      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇
      else {
        if (userPickedAnswer == quizBrain.getGoldAnswer()) {
          myChoice = "gold";
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
        } else if (userPickedAnswer == quizBrain.getSilverAnswer()) {
          myChoice = "silver";
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
        } else if (userPickedAnswer == quizBrain.getBronzeAnswer()) {
          myChoice = "bronze";
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
      }
    });
    if (quizBrain.isFinished() == false) {
      quizBrain.nextQuestion();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
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
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.grey)),
                textColor: Colors.white,
                color: Colors.grey,
                child: Text(
                  quizBrain.getAnswers(0),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
                onPressed: () {
                  //The user picked true.
                  checkAnswer(quizBrain.getAnswers(0));
                  //quizBrain.nextQuestion();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.grey)),
                color: Colors.grey,
                child: Text(
                  quizBrain.getAnswers(1),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswer(quizBrain.getAnswers(1));
                  //quizBrain.nextQuestion();
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.grey)),
                color: Colors.grey,
                child: Text(
                  quizBrain.getAnswers(2),
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  //The user picked false.
                  checkAnswer(quizBrain.getAnswers(2));
                  //quizBrain.nextQuestion();
                },
              ),
            ),
          ),
//        Expanded(child: _ratingBar(myChoice))

//        Row(
//          children: scoreKeeper,
//        )
//          Row(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              SmoothStarRating(
//                allowHalfRating: true,
//                starCount: 1,
//                size: 20,
//                color: Colors.blue,
//                borderColor: Colors.white,
//              )
//            ],
//          ),
        ]);
  }

  Widget _ratingBar(String myChoice) {
    switch (myChoice) {
      case "gold":
        return RatingBar(
            itemCount: 1,
            itemPadding: EdgeInsets.symmetric(),
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Colors.yellowAccent,
              );
            });
      case "silver":
        return RatingBar(
            itemCount: 1,
            itemPadding: EdgeInsets.symmetric(),
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Colors.grey,
              );
            });
      case "bronze":
        return RatingBar(
            itemCount: 1,
            itemPadding: EdgeInsets.symmetric(),
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Colors.orange,
              );
            });
      default:
        return Container();
    }
  }
/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
}
