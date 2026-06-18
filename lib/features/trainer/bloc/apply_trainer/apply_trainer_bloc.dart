import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:teaching_lms_adv/features/trainer/models/apply_trainer.dart';
import 'package:teaching_lms_adv/features/trainer/repository/apply_trainer.dart';



part 'apply_trainer_event.dart';
part 'apply_trainer_state.dart';
part 'apply_trainer_bloc.freezed.dart';

class TrainerApplyBloc
    extends Bloc<ApplyTrainerEvent, ApplyTrainerState> {
  final TrainerRepository repository;

  TrainerApplyBloc({required this. repository})
      : super(const ApplyTrainerState.initial()) {
    on<_Submit>(_onSubmit);
  }

  Future<void> _onSubmit(
    _Submit event,
    Emitter<ApplyTrainerState> emit,
  ) async {
    emit(const ApplyTrainerState.loading());

    final result = await repository.applyTrainer(
      TrainerApplicationModel(
        bio: event.bio,
        expertise: event.expertise,
        experienceYears: event.experienceYears,
      ),
    );

    result.fold(
      (failure) => emit(
        ApplyTrainerState.error(failure.toString()),
      ),
      (_) => emit(
        const ApplyTrainerState.loaded(),
      ),
    );
  }
}