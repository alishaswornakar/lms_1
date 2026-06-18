part of 'trainer_profile_bloc.dart';

@freezed
abstract class TrainerProfileState with _$TrainerProfileState {
  const factory TrainerProfileState.initial() = _Initial;
  const factory TrainerProfileState.loading() = _loading;
  const factory  TrainerProfileState.loaded() = _loaded;
  const factory TrainerProfileState.error(String message) = _error;
  }
