import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trainer_profile_event.dart';
part 'trainer_profile_state.dart';
part 'trainer_profile_bloc.freezed.dart';

class TrainerProfileBloc extends Bloc<TrainerProfileEvent, TrainerProfileState> {
  TrainerProfileBloc() : super(_Initial()) {
    on<TrainerProfileEvent>((event, emit) {
     
    });
  }
}
