import '../../quiz.dart';

abstract class QuizState {}

class QuizInitial extends QuizState {}

class QuizLoading extends QuizState {}

class QuizLoaded extends QuizState {
  final List<Question> questions;

  QuizLoaded(this.questions);
}

class QuizError extends QuizState {
  final String message;

  QuizError(this.message);
}
