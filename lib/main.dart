import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nrg_test/firebase_options.dart';
import 'package:nrg_test/src/features/account/presentation/cubit/auth_cubit.dart';
import 'src/features/account/presentation/cubit/forgot_password_cubit.dart';
import 'src/features/features.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  final authDataSource = AuthDataSource(firebaseAuth, firestore, googleSignIn);
  final authRepository = AuthRepositoryImpl(authDataSource, firebaseAuth);

  runApp(MyApp(authRepository: authRepository));
}

class MyApp extends StatelessWidget {
  final AuthRepository authRepository;

  const MyApp({Key? key, required this.authRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>.value(value: authRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => AuthCubit(
                    SignUpUseCase(authRepository),
                    SignInUseCase(authRepository),
                    GoogleSignInUseCase(
                        authRepository,
                        AuthDataSource(FirebaseAuth.instance,
                            FirebaseFirestore.instance, GoogleSignIn())),
                  )),
          BlocProvider(
              create: (_) =>
                  ForgotPasswordCubit(ForgotPasswordUseCase(authRepository))),
          BlocProvider(create: (_) => CategoryCubit()),
        ],
        child: MaterialApp(
          title: 'nrg quiz',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: FirebaseAuth.instance.currentUser != null
              ? HomePage()
              : LoginPage(),
        ),
      ),
    );
  }
}
