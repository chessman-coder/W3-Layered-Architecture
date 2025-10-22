import 'package:my_first_project/domain/quiz.dart';
import 'package:test/test.dart';

main() {
  test('My first test', () {
    Question q1 = Question(
        title: "4-2", choices: ["1", "2", "3"], goodChoice: "2", point: 10);
    Question q2 = Question(
        title: "4+2", choices: ["1", "2", "3"], goodChoice: "6", point: 10);

    Quiz quiz = Quiz(questions: [q1, q2]);
    // Add players
    Player player1 = Player(playerName: "DARA");
    Player player2 = Player(playerName: "LIDA");
    quiz.addPlayer(player1);
    quiz.addPlayer(player2);

    // Player1 answer
    quiz.answers.clear();
    quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "6"));
    player1.point = quiz.getTotalPoint();

    // Player2 answer
    quiz.answers.clear();
    quiz.addAnswer(Answer(question: q1, answerChoice: "2"));
    quiz.addAnswer(Answer(question: q2, answerChoice: "4"));
    player2.point = quiz.getTotalPoint();

    // SCore eis 100
    expect(player1.point, equals(20));
    expect(player2.point, equals(10));
  });
}

// "dart test --chain-stack-traces" run test in dart
