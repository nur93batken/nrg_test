import '../../quiz.dart';

class GetQuestions {
  final QuestionRepository repository;

  GetQuestions(this.repository);

  Stream<List<Question>> call(String quizId) {
    return repository.getQuestions(quizId);
  }
}
