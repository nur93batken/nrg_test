import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class LoginFormWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const LoginFormWidget({
    required this.formKey,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            controller: usernameController,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            obscureText: true,
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Сыр сөз',
              suffixIcon: Icon(
                Icons.visibility,
                color: AppColors.blue,
                size: 24,
              ),
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
