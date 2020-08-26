class Question {
  String questionText;
  List<String> answers;
  String goldAnswer;
  String silverAnswer;
  String bronzeAnswer;

  Question(String q, List<String> answers, String goldAnswer,
      String silverAnswer, String bronzeAnswer) {
    questionText = q;
    this.answers = answers;
    this.goldAnswer = goldAnswer;
    this.silverAnswer = silverAnswer;
    this.bronzeAnswer = bronzeAnswer;
  }
}
