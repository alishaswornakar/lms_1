import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teaching_lms_adv/features/user_profile/models/profile.dart';
import 'package:teaching_lms_adv/features/user_profile/repository/profile_repo.dart';



part 'profile_me_event.dart';
part 'profile_me_state.dart'; 
part 'profile_me_bloc.freezed.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileMeState> {
  final ProfileRepository repository;

  ProfileBloc(this.repository)
      : super(const ProfileMeState.initial()) {
    on<_GetProfile>(_getProfile);
  }

  Future<void> _getProfile(
  _GetProfile event,
  Emitter<ProfileMeState> emit,
) async {
  emit(const ProfileMeState.loading());

  final result = await repository.getProfile();

  result.fold(
    (failure) {
      emit(ProfileMeState.error(failure.message));
    },
    (profile) {
      emit(ProfileMeState.loaded(profile));
    },
  );
}
}