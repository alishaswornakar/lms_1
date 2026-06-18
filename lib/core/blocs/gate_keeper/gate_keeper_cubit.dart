// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:teaching_lms_adv/core/storage/token_storage.dart';

part 'gate_keeper_cubit.freezed.dart';
part 'gate_keeper_state.dart';

class GateKeeperCubit extends Cubit<GateKeeperState> {
  final TokenStorageService _tokenStorageService;
  GateKeeperCubit(this._tokenStorageService) : super(GateKeeperState.loading());

  Future<void> getStatus() async {
    try {
      await Future.delayed(Duration(seconds: 1));
      final token = await _tokenStorageService.getAccessToken();
      if (token != null) {
        emit(GateKeeperState.authenticated());
      } else {
        emit(GateKeeperState.unAuthenticated());
      }
    } catch (e) {
      emit(GateKeeperState.unAuthenticated());
    }
  }
}
