import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';

import 'package:teaching_lms_adv/features/courses/model/create_course.dart';

abstract class CourseRepository {
  FutureEither<String> createCourse(CourseCreateForm form);
}

class CourseRepositoryImpl implements CourseRepository {
  final ApiService _apiService;

  CourseRepositoryImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  FutureEither<String> createCourse(CourseCreateForm form) async {
    return await _apiService.post(
      "courses/",
      data: form.toMap(),
      fromJson: (json) {
        return "Course created successfully";
      },
    );
  }
}
