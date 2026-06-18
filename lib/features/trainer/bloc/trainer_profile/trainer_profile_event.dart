part of 'trainer_profile_bloc.dart';

@freezed
abstract class TrainerProfileEvent with _$TrainerProfileEvent {
  const factory TrainerProfileEvent.started() = _Started;
}