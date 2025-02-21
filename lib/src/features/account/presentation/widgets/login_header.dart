import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(80),
          ),
          child: Image.asset('assets/images/human.png'),
        ),
        const SizedBox(height: 20),
        Text(
          'Авторизация',
          style: AppTextStyles.f24w700.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
