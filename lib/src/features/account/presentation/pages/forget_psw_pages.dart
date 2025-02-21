import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrg_test/src/core/core.dart';
import 'package:nrg_test/src/features/account/presentation/cubit/forgot_password_cubit.dart';

import '../../account.dart';

class ForgetPswPages extends StatefulWidget {
  @override
  _ForgetPswPages createState() => _ForgetPswPages();
}

class _ForgetPswPages extends State<ForgetPswPages> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
        body: BlocProvider(
          create: (context) => ForgotPasswordCubit(
            ForgotPasswordUseCase(context.read<AuthRepository>()),
          ),
          child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
            listener: (context, state) {
              if (state is ForgotPasswordSuccess) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Сиз жазган email дарегиңизге сыр сөздү калыбына келтирүү үчүн ссылка жиберилди!')),
                );
              } else if (state is ForgotPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is ForgotPasswordLoading) {
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
                                    child: Image.asset(
                                        'assets/images/anonymous.png'),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'Сыр сөздү калыбына келтирүү',
                                          style: AppTextStyles.f24w700
                                              .copyWith(color: AppColors.blue1),
                                        ),
                                        Text(
                                          'Сыр сөздү калыбына келтирүү үчүн, катталуудагы E-mail дарегиңизди жазыңыз, биз сизге шилтеме жиберебиз!',
                                          style: AppTextStyles.f16w400.copyWith(
                                              color: AppColors.orange),
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
                                            filled:
                                                true, // Включить заливку фона
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
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Please enter your e-mail';
                                            }
                                            return null;
                                          },
                                        ),
                                        const SizedBox(
                                          height: 16,
                                        ),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.blue,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical:
                                                    20), // Отступы внутри кнопки
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Закругленные углы
                                            ),
                                          ),
                                          onPressed: () {
                                            final email = _emailController.text;
                                            context
                                                .read<ForgotPasswordCubit>()
                                                .resetPassword(email);
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Center(
                                              child: Text(
                                                'Жөнөтүү',
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
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Артка',
                                                  style: AppTextStyles.f16w600
                                                      .copyWith(
                                                          color:
                                                              AppColors.blue),
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
      ),
    );
  }
}
