import 'package:dartz/dartz.dart';
import '../../account.dart';

class GoogleSignInUseCase {
  final AuthRepository authRepository;
  final AuthDataSource authDataSource;

  GoogleSignInUseCase(this.authRepository, this.authDataSource);

  Future<Either<String, AppUser>> call() async {
    try {
      final appUser = await authDataSource.googleSignIn();
      return Right(appUser);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
