import 'package:dartz/dartz.dart';

import '../../../features.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase(this.repository);

  Future<Either<String, AppUser>> call(
      String email, String password, String username) {
    return repository.signUp(email, password, username);
  }
}
