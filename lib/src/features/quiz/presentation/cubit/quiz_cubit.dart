import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nrg_test/src/features/quiz/presentation/cubit/quiz_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());

  void selectCategory(String category, String image) {
    emit(state.copyWith(category: category, image: image));
  }
}
