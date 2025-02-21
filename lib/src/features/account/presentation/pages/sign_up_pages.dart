import 'package:flutter/material.dart';
import 'package:nrg_test/src/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrg_test/src/features/features.dart';

import '../cubit/auth_cubit.dart';

class SignUpPages extends StatefulWidget {
  @override
  _SignUpPagesState createState() => _SignUpPagesState();
}

class _SignUpPagesState extends State<SignUpPages> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              'assets/images/mainbg.png'), // Укажите путь к вашему изображению
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.user != null) {
              // Перенаправление на главный экран
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Ийгиликтүү катталдыңыз!')),
              );
            } else if (state.error != null) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error!)),
              );
            }
          },
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const SizedBox(height: 100),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: Column(
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
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'Катталуу',
                                        style: AppTextStyles.f24w700
                                            .copyWith(color: AppColors.blue1),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        controller: _usernameController,
                                        decoration: const InputDecoration(
                                          labelText: 'Аты жөнүнүз',
                                          filled: true, // Включить заливку фона
                                          fillColor:
                                              AppColors.white, // Цвет фона
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 18,
                                              horizontal:
                                                  20), // Высота поля ввода
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.blue),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ), // Закругленные углы
                                          ),
                                        ),
                                        style: const TextStyle(
                                          height:
                                              1.5, // Коэффициент высоты текста
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: const InputDecoration(
                                          labelText: 'E-mail',
                                          filled: true, // Включить заливку фона
                                          fillColor:
                                              AppColors.white, // Цвет фона
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 18,
                                              horizontal:
                                                  20), // Высота поля ввода
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColors.blue),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(20),
                                            ), // Закругленные углы
                                          ),
                                        ),
                                        style: const TextStyle(
                                          height:
                                              1.5, // Коэффициент высоты текста
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        obscureText: true,
                                        controller: _passwordController,
                                        decoration: const InputDecoration(
                                          labelText: 'Сыр сөз жазыңыз',
                                          suffixIcon: Icon(
                                            Icons.visibility,
                                            color: AppColors.blue,
                                            size: 24,
                                          ),
                                          filled: true, // Включить заливку фона
                                          fillColor:
                                              AppColors.white, // Цвет фона
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 18,
                                              horizontal:
                                                  20), // Высота поля ввода
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                    20)), // Закругленные углы
                                          ),
                                        ),
                                        style: const TextStyle(
                                          height:
                                              1.5, // Коэффициент высоты текста
                                        ),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter your username';
                                          }
                                          return null;
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.blue,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical:
                                                  20), // Отступы внутри кнопки
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                20), // Закругленные углы
                                          ),
                                        ),
                                        onPressed: () {
                                          final username =
                                              _usernameController.text;
                                          final email = _emailController.text;
                                          final password =
                                              _passwordController.text;
                                          context.read<AuthCubit>().signUp(
                                              email, password, username);
                                        },
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Center(
                                            child: Text(
                                              'Катталуу',
                                              style: AppTextStyles.f18w500
                                                  .copyWith(
                                                      color: AppColors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Мурда катталган болсоңуз?',
                                            style: AppTextStyles.f16w400
                                                .copyWith(
                                                    color: AppColors.blackText),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                'Кирүү',
                                                style: AppTextStyles.f16w600
                                                    .copyWith(
                                                        color: AppColors.blue),
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
