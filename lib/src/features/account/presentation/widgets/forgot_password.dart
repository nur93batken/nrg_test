import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../../features.dart';

class ForgotPasswordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ForgetPswPages()),
            );
          },
          child: Text(
            'Сыр сөздү унуттуңузбу?',
            style: AppTextStyles.f16w600.copyWith(color: AppColors.blue),
          ),
        ),
      ],
    );
  }
}
