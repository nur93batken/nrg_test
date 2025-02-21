import 'package:cloud_firestore/cloud_firestore.dart';

import '../../quiz.dart';

abstract class QuestionRepository {
  Future<void> addQuestion(String quizId, Question question);
  Future<void> deleteQuestion(String quizId, String questionId);
  Stream<List<Question>> getQuestions(String quizId);
}

class QuestionRepositoryImpl implements QuestionRepository {
  final FirebaseFirestore firestore;

  QuestionRepositoryImpl({required this.firestore});

  @override
  Future<void> addQuestion(String quizId, Question question) async {
    await firestore
        .collection('quizzes')
        .doc(quizId)
        .collection('questions')
        .add(question.toMap());
  }

  @override
  Future<void> deleteQuestion(String quizId, String questionId) async {
    await firestore
        .collection('quizzes')
        .doc(quizId)
        .collection('questions')
        .doc(questionId)
        .delete();
  }

  @override
  Stream<List<Question>> getQuestions(String quizId) {
    return firestore
        .collection('quizzes')
        .doc(quizId)
        .collection('questions')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Question.fromMap(doc.data(), doc.id))
              .toList(),
        );
  }
}
