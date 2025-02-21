import '../../quiz.dart';

class DeleteQuestion {
  final QuestionRepository repository;

  DeleteQuestion(this.repository);

  Future<void> call(String quizId, String questionId) async {
    return await repository.deleteQuestion(quizId, questionId);
  }
}
