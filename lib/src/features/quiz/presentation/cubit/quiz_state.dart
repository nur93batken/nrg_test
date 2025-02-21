class CategoryState {
  final String? category;
  final String? image;

  CategoryState({this.category, this.image});

  // Метод для копирования состояния при изменении одной из переменных
  CategoryState copyWith({String? category, String? image}) {
    return CategoryState(
      category: category ?? this.category,
      image: image ?? this.image,
    );
  }
}
