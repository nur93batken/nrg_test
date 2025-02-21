import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../features.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

User? user = FirebaseAuth.instance.currentUser;

final List<Map<String, dynamic>> quizzes = [
  {
    'icon': Icons.bar_chart,
    'title': 'Statistics Math Quiz',
    'subtitle': 'Math - 12 Quizzes',
    'images': 'assets/images/math.png'
  },
  {
    'icon': Icons.functions,
    'title': 'Integers Quiz',
    'subtitle': 'Math - 10 Quizzes',
    'images': 'assets/images/test.png'
  },
];

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _quizController = TextEditingController();
  @override
  void dispose() {
    _quizController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 40),
          _buildHeader(),
          const SizedBox(height: 20),
          _buildQuizJoinCard(),
          const SizedBox(height: 30),
          _buildQuizList(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    String userName = user?.displayName ?? '';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Салам!',
                  style: AppTextStyles.f16w400.copyWith(
                    color: AppColors.orange1,
                  )),
              Text(userName,
                  style: AppTextStyles.f24w700.copyWith(
                    color: AppColors.white,
                  )),
            ],
          ),
          Image.asset(
            'assets/images/ironman.png',
            width: 56,
          )
        ],
      ),
    );
  }

  Widget _buildQuizJoinCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/images/mask.png'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset('assets/images/mac.png', width: 56),
            const SizedBox(height: 12),
            Text('NRG QUIZ',
                style: AppTextStyles.f16w600.copyWith(
                  color: AppColors.orange1,
                )),
            const SizedBox(height: 12),
            Text('Тестин номерин жазда, тестти ойноп башта!',
                textAlign: TextAlign.center,
                style: AppTextStyles.f16w600.copyWith(
                  color: AppColors.white,
                )),
            const SizedBox(height: 12),
            _buildQuizInputField(),
            const SizedBox(height: 12),
            _buildStartButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuizInputField() {
    return TextFormField(
      controller: _quizController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: '000017',
        filled: true,
        fillColor: AppColors.white,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.white.withOpacity(0.5)),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.blue.withOpacity(0.3), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: AppColors.blue.withOpacity(0.5), width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
      ),
      style: const TextStyle(height: 1.0),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter quiz number';
        }
        return null;
      },
    );
  }

  Widget _buildStartButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue1,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'Баштоо',
            style: AppTextStyles.f16w600.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizList() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Жаңы тесттер',
                style:
                    AppTextStyles.f18w600.copyWith(color: AppColors.blackText),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Баары',
                  style: TextStyle(color: AppColors.blue),
                ),
              )
            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: quizzes.length,
            itemBuilder: (context, index) {
              final quiz = quizzes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: InkWell(
                  onTap: () {
                    // Добавьте переход на страницу с тестом
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
        ],
      ),
    );
  }
}
