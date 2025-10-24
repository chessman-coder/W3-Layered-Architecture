import 'package:my_first_project/data/quiz_file_provider.dart';

import 'domain/quiz.dart';
import 'ui/quiz_console.dart';

void main() {
  var filePath = '/assets/quiz.json';

  QuizFileProvider repo = QuizFileProvider(filePath);
  Quiz quiz = repo.readQuiz();
  QuizConsole console = QuizConsole(quiz: quiz);

  console.startQuiz();
}
