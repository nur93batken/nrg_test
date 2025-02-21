import 'package:dartz/dartz.dart';

import '../../account.dart';

abstract class AuthRepository {
  Future<Either<String, AppUser>> signUp(
      String email, String password, String username);
  Future<Either<String, AppUser>> signIn(String email, String password);
  Future<Either<String, AppUser>> googleSignIn();
  Future<void> sendPasswordResetEmail(String email);
  Future<void> signOut();
}
