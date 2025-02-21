import '../domain.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<void> execute(String email) async {
    if (email.isEmpty || !email.contains('@')) {
      throw Exception('Invalid email');
    }
    await repository.sendPasswordResetEmail(email);
  }
}
