part of 'profile_me_bloc.dart';

@freezed
class ProfileMeState with _$ProfileMeState {
  const factory ProfileMeState.initial() = _Initial;

  const factory ProfileMeState.loading() = _Loading;  

  const factory ProfileMeState.loaded(ProfileModel profile) = _Loaded;
  const factory ProfileMeState.error(String message) = _Error;
}