import 'question.dart';
import 'dart:math';

class QuizBrain {
  int _questionNumber = 0;
  int _totalQuestionsAsked = 1;

  //int qnum = 0;
  List<Question> _questionBank = [
    //#1
    Question(
        'What do you do with waste paper?',
        ['Throw in dustbin', 'Give it to mommy', 'Throw it on the ground'],
        'Throw in dustbin',
        'Give it to mommy',
        'Throw it on the ground'),
    //#2
    Question(
        'What do you do when you meet a friend?',
        ['Look away', 'Smile and say \'Hi\'', 'Run'],
        'Look away',
        'Smile and say \'Hi\'',
        'Run'),
    //#3
    Question(
        'When I am bored?',
        ['Run around', 'Ask mommy/daddy for an activity', 'Eat candies'],
        'Run around',
        'Ask mommy/daddy for an activity',
        'Eat candies'),
    //#4
    Question(
        'When crossing a road, I',
        [
          'Hold parent’s hand and watch out for vehicles before crossing',
          'Play football on the road',
          'Don’t look around and run'
        ],
        'Hold parent’s hand and watch out for vehicles before crossing',
        'Play football on the road',
        'Don’t look around and run'),
    //#5
    Question(
        'When my toys are scattered on the floor?',
        [
          'I clean up the toys ',
          'I throw some more toys on the floor',
          'I walk on them'
        ],
        'I clean up the toys ',
        'I throw some more toys on the floor',
        'I walk on them'),
    //#6
    Question(
        'When I come home from outside, I',
        [
          'Pick up a food item and start eating',
          'Throw away my shoes and sit on the couch',
          'Wash my hands and face and wipe with a clean towel'
        ],
        'Pick up a food item and start eating',
        'Throw away my shoes and sit on the couch',
        'Wash my hands and face and wipe with a clean towel'),
    //#7
    Question(
        'Greeting people outside if we come across someone.',
        ['Say \'Hi\', \'Hello\'', 'Turn your face', 'Run Away'],
        'Say \'Hi\', \'Hello\'',
        'Turn your face',
        'Run Away'),
    //#8
    Question(
        'Greeting the guests who come home',
        [
          'Ask \"how are you doing?\" and if they would like to have something.',
          'Ask \"Did you bring me a gift?\"',
          'Say \"I\'m going to watch TV\" and leave'
        ],
        'Ask \"how are you doing?\" and if they would like to have something.',
        'Ask \"Did you bring me a gift?\"',
        'Say \"I\'m going to watch TV\" and leave'),
    //#9
    Question(
        'When I cough or sneeze.?',
        [
          'I cover my face',
          'I sneeze right on the floor',
          'I run to the bathroom'
        ],
        'I cover my face',
        'I sneeze right on the floor',
        'I run to the bathroom'),
    //#10
    Question(
        'When adults are talking to each other or on phone, I',
        [
          'Make noise and run around',
          'Keep talking to them',
          'Throw it on the ground'
        ],
        'Make noise and run around',
        'Keep talking to them',
        'Say \'Excuse me\', and then start talking'),
    //#11
    Question(
        'When someone sneezes',
        ['Say \'Bless You\'', 'Sneeze back', 'Turn your face'],
        'Say \'Bless You\'',
        'Sneeze back',
        'Turn your face'),
    //#12
    Question(
        'When you want to access other children’s toys',
        [
          'Ask them politely',
          'Grab a toy and start playing',
          'Fight for a toy'
        ],
        'Ask them politely',
        'Grab a toy and start playing',
        'Fight for a toy'),
    //#13
    Question(
        'When you request someone for something, you say',
        [
          'Please, can I have it?\'',
          'Grab the item and run',
          'Cry for the item'
        ],
        'Please, can I have it?\'',
        'Grab the item and run',
        'Cry for the item'),
    //#14
    Question(
        'When someone has helped you, you say',
        ['\'Thank You\'', 'Ignore and leave', 'Cry for another item'],
        '\'Thank You\'',
        'Ignore and leave',
        'Cry for another item'),
    //#15
    Question(
        'Cleaning up the toys after playing ( both at home and at other\'s places)',
        [
          'Help mom/dad to cleanup toys on the floor',
          'Scatter more toys',
          'Keep playing'
        ],
        'Help mom/dad to cleanup toys on the floor',
        'Scatter more toys',
        'Keep playing'),
    //#16
    Question(
        'When I want something in classroom, I,',
        [
          'Raise my hand and then speak',
          'Go grab the item I want',
          'Start speaking and interrupting when other are speaking'
        ],
        'Raise my hand and then speak',
        'Go grab the item I want',
        'Start speaking and interrupting when other are speaking'),
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
