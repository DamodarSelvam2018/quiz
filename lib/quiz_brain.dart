import 'question.dart';
import 'dart:math';

class QuizBrain {
  int _questionNumber = 0;
  int _totalQuestionsAsked = 1;
  //int qnum = 0;
  List<Question> _questionBank = [
    Question(
        'What do you do with waste paper?',
        ['Throw in dustbin', 'Give it to mommy', 'Throw it on the ground'],
        'Throw in dustbin',
        'Give it to mommy',
        'Throw it on the ground'),
    Question(
        'What do you do when you meet a friend?',
        ['Look away', 'Smile and say \'Hi\'', 'Run'],
        'Look away',
        'Smile and say \'Hi\'',
        'Run'),
    Question(
        'When I am bored?',
        ['Run around', 'Ask mommy/daddy for an activity', 'Eat candies'],
        'Run around',
        'Ask mommy/daddy for an activity',
        'Eat candies'),
  ];
  List<int> questionsAsked = [];

  void nextQuestion() {
//    if (_questionNumber < _questionBank.length - 1) {
//      print(_questionNumber.toString() + 'in nextQuestion');
//      print(_questionBank.length.toString() + ' _questionBank.length');
//      _questionNumber++;
//      print(_questionNumber.toString() + 'in nextQuestion');
//    }
    this._questionNumber = Random().nextInt(_questionBank
        .length); //This whole segment gets a random generated index for the question to be asked

    while (questionsAsked.contains(this._questionNumber)) {
      this._questionNumber = Random().nextInt(_questionBank.length);
    }
    questionsAsked.add(
        this._questionNumber); //Add this question index into the asked list
    print(_questionNumber.toString() +
        ' was asked, questions asked so far ' +
        questionsAsked.length.toString());
  }

  void prevQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber--;
    }
  }

  int questionBankLength() {
    return _questionBank.length;
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionText1(int index) {
    return _questionBank[index].questionText;
  }

  String getAnswers(int index) {
    return _questionBank[_questionNumber].answers[index];
  }

//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

  String checkAnswer(String selection) {
    //bool isCorrect = false;
    String star;
    if (selection == _questionBank[_questionNumber].goldAnswer) {
      // _score++;
      //isCorrect = true;
      star = "gold";
      print('picked the gold star ');
    } else if (selection == _questionBank[_questionNumber].silverAnswer) {
      star = "silver";
      print('picked the silver star ');
    } else if (selection == _questionBank[_questionNumber].bronzeAnswer) {
      star = "bronze";
      print('picked the bronze star ');
    }
    _totalQuestionsAsked++; //regardless, question has been asked and button has been pressed
    return star;
  }

  String getGoldAnswer() {
    print(_questionNumber.toString() + 'in getGoldAnswer');
    return _questionBank[_questionNumber].goldAnswer;
  }

  String getSilverAnswer() {
    print(_questionNumber.toString() + 'in getSilverAnswer');
    return _questionBank[_questionNumber].silverAnswer;
  }

  String getBronzeAnswer() {
    print(_questionNumber.toString() + 'in getBronzeAnswer');
    return _questionBank[_questionNumber].bronzeAnswer;
  }

  //TODO: Step 3 Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber == _questionBank.length - 1) {
      //TODO: Step 3 Part B - Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.
      print('Now returning true');
      return true;
    } else {
      return false;
    }
  }

  String getChoice(int butChoice) {
    String choiceText;
    switch (butChoice) {
      case 0:
        choiceText = _questionBank[_questionNumber].goldAnswer;
        break;
      case 1:
        choiceText = _questionBank[_questionNumber].silverAnswer;
        break;
      case 2:
        choiceText = _questionBank[_questionNumber].bronzeAnswer;
        break;
    }
    return choiceText;
  }

  int getTotalQuestionsAsked() {
    return _totalQuestionsAsked;
  }

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to index 0.
  void reset() {
    _questionNumber = 0;
    _totalQuestionsAsked = 1;
    questionsAsked.clear();
  }
}
