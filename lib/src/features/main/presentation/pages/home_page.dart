import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/core.dart';
import '../../../features.dart';
import 'screen_home.dart';

//import '../../../features.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchPage(),
    QuizCreationScreen(),
    LeadersPage(),
    AccountPage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.blue,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _screens[_currentIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: AppColors.blue,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            _onTabTapped(index);
          },
          items: const [
            Icon(
              Icons.home,
              color: AppColors.white,
            ),
            Icon(
              Icons.search,
              color: AppColors.white,
            ),
            Icon(
              Icons.add,
              color: AppColors.white,
            ),
            Icon(
              Icons.start,
              color: AppColors.white,
            ),
            Icon(
              Icons.person,
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
