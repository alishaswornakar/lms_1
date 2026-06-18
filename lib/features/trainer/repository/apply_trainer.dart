import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';
import 'package:teaching_lms_adv/features/trainer/models/apply_trainer.dart';



class TrainerRepository {
  final ApiService _apiService;

  TrainerRepository(this._apiService);

 FutureEither<TrainerApplicationModel> applyTrainer(TrainerApplicationModel model) async {
    return await _apiService.post<TrainerApplicationModel>(
      'trainer/apply/',
      fromJson: (json) => TrainerApplicationModel.fromJson(json),
      data: {
        'bio': model.bio,
        'expertise': model.expertise,
        'experience_years': model.experienceYears,
      },
    );
  }
}