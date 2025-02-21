import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../features.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final FirebaseAuth _firebaseAuth;

  AuthRepositoryImpl(this.authDataSource, this._firebaseAuth);

  @override
  Future<Either<String, AppUser>> signUp(
      String email, String password, String username) async {
    try {
      final appUser = await authDataSource.signUp(email, password, username);
      return Right(appUser);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, AppUser>> signIn(String email, String password) async {
    try {
      final user = await authDataSource.signIn(email, password);

      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await authDataSource.signOut();
  }

  @override
  Future<Either<String, AppUser>> googleSignIn() async {
    try {
      final appUser = await authDataSource.googleSignIn();
      return Right(appUser);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
