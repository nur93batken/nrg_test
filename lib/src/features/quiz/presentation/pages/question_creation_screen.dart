import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/constants/constants.dart';

class QuestionCreationScreen extends StatefulWidget {
  final String quizId; // Тесттин уникалдуу IDсы

  const QuestionCreationScreen({super.key, required this.quizId});

  @override
  _QuestionCreationScreenState createState() => _QuestionCreationScreenState();
}

class _QuestionCreationScreenState extends State<QuestionCreationScreen> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();
  int _correctAnswerIndex = 0;

  void _saveQuestion() async {
    if (_questionController.text.isEmpty ||
        _option1Controller.text.isEmpty ||
        _option2Controller.text.isEmpty ||
        _option3Controller.text.isEmpty ||
        _option4Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Бардык талааларды толтуруңуз')));
      return;
    }

    // Жаңы суроо түзөбүз
    Map<String, dynamic> newQuestion = {
      'question': _questionController.text,
      'options': [
        _option1Controller.text,
        _option2Controller.text,
        _option3Controller.text,
        _option4Controller.text
      ],
      'correctIndex': _correctAnswerIndex,
    };

    // Firestore'дон тест документин алабыз
    DocumentReference quizRef =
        FirebaseFirestore.instance.collection('quizzes').doc(widget.quizId);

    await quizRef.update({
      'questions': FieldValue.arrayUnion([newQuestion]) // Массивге кошобуз
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Суроо сакталды!')));

    // Талааларды тазалоо
    _questionController.clear();
    _option1Controller.clear();
    _option2Controller.clear();
    _option3Controller.clear();
    _option4Controller.clear();
  }

  void _deleteQuestion(int questionIndex) async {
    DocumentReference quizRef =
        FirebaseFirestore.instance.collection('quizzes').doc(widget.quizId);

    var quizSnapshot = await quizRef.get();
    List<dynamic> currentQuestions = quizSnapshot['questions'];

    // Тандаган индекстеги суроону өчүрөбүз
    currentQuestions.removeAt(questionIndex);

    await quizRef.update({'questions': currentQuestions});

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Суроо өчүрүлдү!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        title: const Text('Суроолорду кошуу'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _questionController,
              decoration: const InputDecoration(labelText: 'Суроо'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _option1Controller,
              decoration: const InputDecoration(labelText: 'Вариант 1'),
            ),
            TextField(
              controller: _option2Controller,
              decoration: const InputDecoration(labelText: 'Вариант 2'),
            ),
            TextField(
              controller: _option3Controller,
              decoration: const InputDecoration(labelText: 'Вариант 3'),
            ),
            TextField(
              controller: _option4Controller,
              decoration: const InputDecoration(labelText: 'Вариант 4'),
            ),
            const SizedBox(height: 10),
            DropdownButton<int>(
              value: _correctAnswerIndex,
              items: List.generate(4, (index) {
                return DropdownMenuItem(
                  value: index,
                  child: Text(
                    'Туура жооп: Вариант ${index + 1}',
                    style: AppTextStyles.f16w600
                        .copyWith(color: AppColors.blue.withOpacity(0.7)),
                  ),
                );
              }),
              onChanged: (value) {
                setState(() {
                  _correctAnswerIndex = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveQuestion,
              child: const Text('Сактоо'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('quizzes')
                    .doc(widget.quizId)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var quizData = snapshot.data!.data() as Map<String, dynamic>;
                  List<dynamic> questions = quizData['questions'] ?? [];

                  if (questions.isEmpty) {
                    return const Center(child: Text('Суроолор кошула элек.'));
                  }

                  return ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      var questionData = questions[index];

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: ListTile(
                          title: Text(questionData['question']),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(
                              questionData['options'].length,
                              (i) => Text(
                                '${i + 1}. ${questionData['options'][i]}',
                                style: TextStyle(
                                  fontWeight: questionData['correctIndex'] == i
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: questionData['correctIndex'] == i
                                      ? Colors.green
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteQuestion(index),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
