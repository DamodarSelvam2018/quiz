import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

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

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      print(_questionNumber.toString() + 'in nextQuestion');
      _questionNumber++;
      print(_questionNumber.toString() + 'in nextQuestion');
    }
  }

  void prevQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      print(_questionNumber.toString() + 'in prevQuestion');
      _questionNumber--;
      print(_questionNumber.toString() + 'in prevQuestion');
    }
  }

  String getQuestionText() {
    print(_questionNumber.toString() + 'in getQuestionText');
    return _questionBank[_questionNumber].questionText;
  }

  String getAnswers(int index) {
    print(_questionNumber.toString() + 'in getAnswers');
    return _questionBank[_questionNumber].answers[index];
  }

//  bool getCorrectAnswer() {
//    return _questionBank[_questionNumber].questionAnswer;
//  }

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

  //TODO: Step 4 part B - Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}
