import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrg_test/src/features/quiz/presentation/cubit/quiz_state.dart';

import '../../../../core/core.dart';
import '../presentation.dart';
import '../widgets/category_bottom_sheet.dart';

class QuizCreationScreen extends StatefulWidget {
  @override
  _QuizCreationScreenState createState() => _QuizCreationScreenState();
}

class _QuizCreationScreenState extends State<QuizCreationScreen> {
  final TextEditingController _quizTitleController = TextEditingController();
  int selectedMinutes = 0;

  void _showCategoryBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.blue,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => CategoryBottomSheet(
        onCategorySelected: context.read<CategoryCubit>().selectCategory,
      ),
    );
  }

  Future<void> _saveQuiz() async {
    final categoryState = context.read<CategoryCubit>().state;

    if (_quizTitleController.text.isEmpty) {
      _showSnackBar('Заполните заголовок');
      return;
    }
    if (categoryState.category == null) {
      _showSnackBar('Выберите категорию');
      return;
    }

    try {
      // Firestoreго тестти кошобуз
      DocumentReference quizRef =
          await FirebaseFirestore.instance.collection('quizzes').add({
        'title': _quizTitleController.text,
        'category': categoryState.category,
        'categoryImage': categoryState.image,
        'minutes': selectedMinutes,
        'questions': [],
      });

      _showSnackBar('Тест сохранён успешно!');
      _quizTitleController.clear();

      // Суроолорду киргизүүчү экранга өтүү
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionCreationScreen(quizId: quizRef.id),
        ),
      );
    } catch (e) {
      _showSnackBar('Ошибка сохранения теста: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'Тест түзүү',
              style: AppTextStyles.f24w700.copyWith(color: AppColors.blue),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            // Выбор категории
            InkWell(
              onTap: _showCategoryBottomSheet,
              child: BlocSelector<CategoryCubit, CategoryState, CategoryState>(
                selector: (state) => state,
                builder: (context, state) {
                  return Container(
                    height: 140,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppColors.blue.withOpacity(0.2), width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.category ?? 'Тесттин категориясын тандаңыз',
                          style:
                              TextStyle(color: AppColors.blue.withOpacity(0.5)),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          state.image ?? 'assets/images/addimage.png',
                          width: 50,
                          height: 50,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 40),

            // Поле ввода названия теста
            TextFormField(
              controller: _quizTitleController,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.blue1.withOpacity(0.1),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
                border: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.blue.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.blue.withOpacity(0.2), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.blue.withOpacity(0.5), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                suffixIcon: IconButton(
                  onPressed: _quizTitleController.clear,
                  icon:
                      Icon(Icons.clear, color: AppColors.blue.withOpacity(0.7)),
                ),
                hintText: 'Тесттин аталышы',
                hintStyle: TextStyle(color: AppColors.blue.withOpacity(0.7)),
              ),
              style: const TextStyle(color: AppColors.blue, height: 1.5),
            ),
            const SizedBox(height: 10),

            // Выбор времени теста
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: AppColors.blue.withOpacity(0.2), width: 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Тесттин минутасы',
                    style: AppTextStyles.f16w500
                        .copyWith(color: AppColors.blue.withOpacity(0.7)),
                    textAlign: TextAlign.center,
                  ),
                  DropdownButton<int>(
                    value: selectedMinutes,
                    icon: Icon(Icons.arrow_drop_down,
                        color: AppColors.blue.withOpacity(0.7)),
                    iconSize: 30,
                    elevation: 0,
                    style: const TextStyle(color: Colors.black, fontSize: 18),
                    dropdownColor: Colors.white,
                    underline: const SizedBox(),
                    items: List.generate(31, (index) {
                      return DropdownMenuItem(
                        value: index,
                        child: Text(
                          index.toString().padLeft(2, '0'),
                          style: AppTextStyles.f16w600
                              .copyWith(color: AppColors.blue.withOpacity(0.7)),
                        ),
                      );
                    }),
                    onChanged: (value) =>
                        setState(() => selectedMinutes = value!),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Кнопка сохранения теста
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: _saveQuiz,
              child: const Center(
                child: Text(
                  'Улантуу',
                  style: TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
