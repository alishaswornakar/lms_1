import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teaching_lms_adv/core/blocs/base_state/base.dart';
import 'package:teaching_lms_adv/features/courses/model/create_course.dart';
import 'package:teaching_lms_adv/features/courses/repositories/course_repository.dart';


part 'course_create_event.dart';
part 'course_create_state.dart';
part 'course_create_bloc.freezed.dart';

class CourseCreateBloc extends Bloc<CourseCreateEvent, CourseCreateState> {
  final CourseRepository _repo;
  CourseCreateBloc({required CourseRepository repo})
    : _repo = repo,
      super(CourseCreateState.initial()) {
    on<_Create>(_onCreateCourse);
  }

  Future<void> _onCreateCourse(
    _Create event,
    Emitter<CourseCreateState> emit,
  ) async {
    emit(CourseCreateState.loading());
    final result = await _repo.createCourse(event.form);
    result.fold(
      (l) => emit(CourseCreateState.failure(l)),
      (r) => emit(CourseCreateState.loaded(r)),
    );
  }
}
