import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class SignUpSuggestionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 200,
          child: Text(
            'Мурда катталбаган болсоңуз?',
            style: AppTextStyles.f16w400.copyWith(color: AppColors.blackText),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPages()),
            );
          },
          child: Text(
            'Катталуу',
            style: AppTextStyles.f16w600.copyWith(color: AppColors.blue),
          ),
        ),
      ],
    );
  }
}
