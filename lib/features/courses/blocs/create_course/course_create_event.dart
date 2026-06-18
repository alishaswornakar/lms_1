part of 'course_create_bloc.dart';

@freezed
abstract class CourseCreateEvent with _$CourseCreateEvent {
  const factory CourseCreateEvent.create(CourseCreateForm form) = _Create;
}