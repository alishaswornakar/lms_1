part of 'apply_trainer_bloc.dart';

@freezed
 abstract class ApplyTrainerState with _$ApplyTrainerState {
  const factory ApplyTrainerState.initial() = _Initial;
  const factory ApplyTrainerState.loading() = _Loading;
  const factory ApplyTrainerState.loaded() = _Loaded;
  const factory ApplyTrainerState.error(String message) = _Error;
}
