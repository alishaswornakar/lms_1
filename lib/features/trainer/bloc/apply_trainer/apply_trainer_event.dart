part of 'apply_trainer_bloc.dart';

@freezed
abstract class ApplyTrainerEvent with _$ApplyTrainerEvent {
  const factory ApplyTrainerEvent.submit({
    required String bio,
    required String expertise,
    required int experienceYears,
  }) = _Submit;
  const factory ApplyTrainerEvent.started() = _Started;
}