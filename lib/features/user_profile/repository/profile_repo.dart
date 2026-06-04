
import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';
import 'package:teaching_lms_adv/features/user_profile/models/profile.dart';


class ProfileRepository {
  final ApiService _apiService;

  ProfileRepository(this._apiService);

  FutureEither<ProfileModel> getProfile() async {
    return await _apiService.get<ProfileModel>(
      '/profile/me/',
      fromJson: (json) => ProfileModel.fromJson(json),
    );
  }
}