import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';

import 'package:teaching_lms_adv/features/courses/model/category_model.dart';

abstract class CategoryRepository {
  FutureEither<List<CategoryModel>> getCategories();
}

class CategoryRepositoryImpl implements CategoryRepository {
  final ApiService _apiService;

  CategoryRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  FutureEither<List<CategoryModel>> getCategories() async {
    return await _apiService.get(
      "courses/categories/",
      fromJson: (json) {
        final categories = List.from(
          json,
        ).map((e) => CategoryModel.fromMap(e)).toList();
        return categories;
      },
    );
  }
}
