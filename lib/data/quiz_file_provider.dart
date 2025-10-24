import 'dart:convert';
import 'dart:io';

import 'package:my_first_project/domain/quiz.dart';

class QuizFileProvider {
  final String filePath;

  QuizFileProvider(this.filePath);

  Quiz readQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('Quiz file not found: $filePath');
    }

    final content = file.readAsStringSync();
    final data = jsonDecode(content) as Map<String, dynamic>;
    var questionJson = data['questions'] as List;

    List<Question> questions = questionJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        point: q['point'] ?? 10,
      );
    }).toList();
    return Quiz(id: data['id'], questions: questions);
  }
}
