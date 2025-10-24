import 'package:uuid/uuid.dart';

var uuid = Uuid().v4();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question(
      {String? id,
      required this.title,
      required this.choices,
      required this.goodChoice,
      this.point = 1})
      : id = id ?? uuid;
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({String? id, required this.questionId, required this.answerChoice})
      : id = id ?? uuid;

  bool isGood(Quiz quiz) {
    Question? question = quiz.getQuestionById(questionId);
    if (question == null) return false;
    return this.answerChoice == question.goodChoice;
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({String? id, required this.questions}) : id = id ?? uuid;

  Question? getQuestionById(String id) {
    for (var question in questions) {
      if (question.id == id) return question;
    }
    return null;
  }

  Answer? getAnswerById(String id) {
    for (var answer in answers) {
      if (answer.id == id) return answer;
    }
    return null;
  }

  void addAnswer(Answer asnwer) {
    this.answers.add(asnwer);
  }

  void addPlayer(Player playerName) {
    this.players.add(playerName);
  }

  int getTotalPoint() {
    int totalPoint = 0;
    for (Answer answer in answers) {
      if (answer.isGood(this)) {
        totalPoint += getQuestionById(answer.questionId)?.point ?? 0;
      }
    }
    return totalPoint;
  }

  int getScoreInPercentage() {
    int totalSCore = 0;
    for (Answer answer in answers) {
      if (answer.isGood(this)) {
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
