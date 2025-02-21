import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core.dart';
import '../cubit/auth_cubit.dart';

class GoogleSignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightGrey,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        // Google Sign-In логикасы
        context.read<AuthCubit>().googleSignIn();
      },
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.g_mobiledata,
              color: AppColors.orange,
              size: 30,
            ),
            Text(
              'Google менен кириңиз',
              style: AppTextStyles.f18w500.copyWith(color: AppColors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
