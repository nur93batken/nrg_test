import 'package:dartz/dartz.dart';

import '../../account.dart';
import '../repositories/auth_repository.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<Either<String, AppUser>> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
