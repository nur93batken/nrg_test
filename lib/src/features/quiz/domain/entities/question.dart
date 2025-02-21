class Question {
  final String id;
  final String question;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.id,
    required this.question,
    required this.options,
    required this.correctIndex,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'question': question,
      'options': options,
      'correctIndex': correctIndex,
    };
  }

  factory Question.fromMap(Map<String, dynamic> map, String id) {
    return Question(
      id: id,
      question: map['question'],
      options: List<String>.from(map['options']),
      correctIndex: map['correctIndex'],
    );
  }
}
