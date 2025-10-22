import 'dart:io';

import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write('Your name: ');
      String? playerNameInput = stdin.readLineSync();

      if (playerNameInput == null || playerNameInput.isEmpty) {
        break;
      }

      Player player = quiz.players.firstWhere(
        (p) => p.playerName == playerNameInput,
        orElse: () {
          Player currentPlayer = Player(playerName: playerNameInput);
          quiz.addPlayer(currentPlayer);
          return currentPlayer;
        },
      );

      for (var question in quiz.questions) {
        print('Question: ${question.title} - ( ${question.point} points)');
        print('Choices: ${question.choices}');
        stdout.write('Your answer: ');
        String? userInput = stdin.readLineSync();

        // Check for null input
        if (userInput != null && userInput.isNotEmpty) {
          Answer answer = Answer(question: question, answerChoice: userInput);
          quiz.addAnswer(answer);
        } else {
          print('No answer entered. Skipping question.');
        }

        print('');
      }
      int score = quiz.getScoreInPercentage();
      player.point = quiz.getTotalPoint();
      print('$player, your score in percentage: $score %');
      print('$player, your score in points: ${player.point}');
      print('');
      for (Player player in quiz.players) {
        print('Player: ${player.playerName}\tScore: ${player.point}');
      }
      quiz.answers.clear();
    }
    print('--- Quiz Finished ---');
  }
}
