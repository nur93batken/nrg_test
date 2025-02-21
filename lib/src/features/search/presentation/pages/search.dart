import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/core.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPage createState() => _SearchPage();
}

final List<Map<String, dynamic>> quizzes = [
  {
    'icon': Icons.bar_chart,
    'title': 'Statistics Math Quiz',
    'subtitle': 'Math - 12 Quizzes',
    'images': 'assets/images/test.png'
  },
  {
    'icon': Icons.functions,
    'title': 'Integers Quiz',
    'subtitle': 'Math - 10 Quizzes',
    'images': 'assets/images/mail.png'
  },
  {
    'icon': Icons.book,
    'title': 'Statistics Math Quiz',
    'subtitle': 'Math - 12 Quizzes',
    'images': 'assets/images/games.png'
  },
  {
    'icon': Icons.functions,
    'title': 'Integers Quiz',
    'subtitle': 'Math - 10 Quizzes',
    'images': 'assets/images/images.png'
  },
  {
    'icon': Icons.charging_station,
    'title': 'Statistics Math Quiz',
    'subtitle': 'Math - 12 Quizzes',
    'images': 'assets/images/internet.png'
  },
  {
    'icon': Icons.functions,
    'title': 'Integers Quiz',
    'subtitle': 'Math - 10 Quizzes',
    'images': 'assets/images/extensions.png'
  },
  {
    'icon': Icons.bar_chart,
    'title': 'Statistics Math Quiz',
    'subtitle': 'Math - 12 Quizzes',
    'images': 'assets/images/code.png'
  },
  {
    'icon': Icons.functions,
    'title': 'Integers Quiz',
    'subtitle': 'Math - 10 Quizzes',
    'images': 'assets/images/bills.png'
  },
];

class _SearchPage extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 40),
              Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Издөө',
                        style: AppTextStyles.f24w700
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      cursorColor: AppColors.white,
                      controller: _searchController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.blue1, // Цвет фона
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 20), // Высота поля ввода
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.white
                                  .withOpacity(0.5)), // Цвет границы
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.white.withOpacity(0.3),
                              width: 2), // Цвет границы, когда поле активно
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.white.withOpacity(0.5),
                              width: 2), // Цвет границы, когда поле в фокусе
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        prefixIcon: Icon(Icons.search,
                            color: AppColors.white
                                .withOpacity(0.7)), // Иконка слева
                        suffixIcon: Icon(Icons.clear,
                            color: AppColors.white
                                .withOpacity(0.7)), // Иконка справа
                        hintText: 'Издөө...', // Подсказка внутри поля
                        hintStyle: const TextStyle(
                            color: AppColors.grey), // Цвет текста подсказки
                      ),
                      style: const TextStyle(
                        color: AppColors.white, // Цвет текста
                        height: 1.5, // Коэффициент высоты текста
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter text';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height -
                        268, // Высота экрана
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Тесттер',
                              style: AppTextStyles.f18w600
                                  .copyWith(color: AppColors.blackText),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Баары',
                                style: TextStyle(color: AppColors.blue),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: quizzes.length,
                            itemBuilder: (context, index) {
                              final quiz = quizzes[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: InkWell(
                                  onTap: () {
                                    // Handle the click event here
                                  },
                                  child: QuizCard(
                                    icon: quiz['icon'],
                                    title: quiz['title'],
                                    subtitle: quiz['subtitle'],
                                    assets: quiz['images'],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
