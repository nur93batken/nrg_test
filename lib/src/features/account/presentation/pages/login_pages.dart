import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrg_test/src/core/core.dart';
import 'package:nrg_test/src/features/account/presentation/cubit/auth_cubit.dart';

import '../../../features.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.user != null) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Кош келиңиз!')),
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const SizedBox(height: 100),
                        // Бөлүнгөн башкы виджетти чакыруу login_header
                        HeaderWidget(),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          child: Column(
                            children: [
                              LoginFormWidget(
                                // Кирүү формасын чакыруу login_form
                                formKey: _formKey,
                                usernameController: _usernameController,
                                passwordController: _passwordController,
                              ),
                              const SizedBox(height: 8),
                              // Сыр сөздү унуттуңузбу? бөлүгү forgot_passord
                              ForgotPasswordWidget(),
                              const SizedBox(height: 8),
                              // Кирүү кнопкасы
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.blue,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  final email = _usernameController.text;
                                  final password = _passwordController.text;
                                  context
                                      .read<AuthCubit>()
                                      .signIn(email, password);
                                },
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      'Кирүү',
                                      style: AppTextStyles.f18w500
                                          .copyWith(color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Катталуу бөлүгү sign_up_suggestion
                              SignUpSuggestionWidget(),
                              const SizedBox(height: 20),
                              // Google менен кирүү кнопкасы google_sign_in_button
                              GoogleSignInButton(),
                            ],
                          ),
                        )
                      ],
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
