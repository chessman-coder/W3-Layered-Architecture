class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question(
      {required this.title,
      required this.choices,
      required this.goodChoice,
      this.point = 1});
}

class Answer {
  final Question question;
  final String answerChoice;

  Answer({required this.question, required this.answerChoice});

  bool isGood() {
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({required this.questions});

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  void addPlayer(Player playerName) {
    this.players.add(playerName);
  }

  int getTotalPoint() {
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalPoint += answer.question.point;
      }
    }
    return totalPoint;
  }

  int getScoreInPercentage() {
    int totalSCore = 0;
    for (Answer answer in answers) {
      if (answer.isGood()) {
        totalSCore++;
      }
    }
    return ((totalSCore / questions.length) * 100).toInt();
  }
}

class Player {
  final String playerName;
  int point = 0;

  Player({required this.playerName});
}
