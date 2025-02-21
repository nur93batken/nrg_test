import 'package:flutter_bloc/flutter_bloc.dart';
import '../../account.dart';

class AuthState {
  final bool isLoading;
  final AppUser? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, AppUser? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error,
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;
  final GoogleSignInUseCase googleSignInUseCase;

  AuthCubit(this.signUpUseCase, this.signInUseCase, this.googleSignInUseCase)
      : super(AuthState());

  Future<void> signUp(String email, String password, String username) async {
    emit(AuthState(isLoading: true));
    final result = await signUpUseCase(email, password, username);
    result.fold(
      (error) => emit(AuthState(error: error.toString())),
      (user) => emit(AuthState(user: user)),
    );
  }

  Future<void> signIn(String email, String password) async {
    emit(AuthState(isLoading: true));
    final result = await signInUseCase(email, password);
    result.fold(
      (error) => emit(AuthState(error: error.toString())),
      (user) => emit(AuthState(user: user)),
    );
  }

  Future<void> googleSignIn() async {
    emit(state.copyWith(isLoading: true));
    final result = await googleSignInUseCase();
    result.fold(
      (error) =>
          emit(state.copyWith(isLoading: false, error: error.toString())),
      (user) => emit(state.copyWith(isLoading: false, user: user)),
    );
  }
}
