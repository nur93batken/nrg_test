import 'package:flutter/material.dart';
import '../../../../core/core.dart';

class CategoryBottomSheet extends StatelessWidget {
  final Function(String, String) onCategorySelected;

  const CategoryBottomSheet({super.key, required this.onCategorySelected});

  static const List<Map<String, String>> categories = [
    {"title": "Математика", "image": "assets/images/math.png"},
    {"title": "Физика", "image": "assets/images/extensions.png"},
    {"title": "Химия", "image": "assets/images/test.png"},
    {"title": "Биология", "image": "assets/images/animal.png"},
    {"title": "История", "image": "assets/images/browse.png"},
    {"title": "Информатика", "image": "assets/images/code.png"},
    {"title": "География", "image": "assets/images/internet.png"},
  ];

  void _selectCategory(BuildContext context, String title, String image) {
    onCategorySelected(title, image);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 500,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text("Категория тандаңыз",
              style: AppTextStyles.f18w600.copyWith(color: AppColors.white)),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: InkWell(
                    onTap: () => _selectCategory(
                        context, category["title"]!, category["image"]!),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue1.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: AppColors.white.withOpacity(0.1), width: 2),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: AppColors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Image.asset(category["image"]!),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              category["title"]!,
                              style: AppTextStyles.f16w600
                                  .copyWith(color: AppColors.white),
                            ),
                          ),
                          IconButton(
                            onPressed: () => _selectCategory(context,
                                category["title"]!, category["image"]!),
                            icon: Icon(Icons.add,
                                color: AppColors.white.withOpacity(0.8)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
