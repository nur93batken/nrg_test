import '../../quiz.dart';

class AddQuestion {
  final QuestionRepository repository;

  AddQuestion(this.repository);

  Future<void> call(String quizId, Question question) async {
    return await repository.addQuestion(quizId, question);
  }
}
