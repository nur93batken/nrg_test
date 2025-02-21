import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase useCase;

  ForgotPasswordCubit(this.useCase) : super(ForgotPasswordInitial());

  Future<void> resetPassword(String email) async {
    emit(ForgotPasswordLoading());
    try {
      await useCase.execute(email);
      emit(ForgotPasswordSuccess());
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }
}
