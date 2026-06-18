part of 'gate_keeper_cubit.dart';

@freezed
abstract class GateKeeperState with _$GateKeeperState {
  const factory GateKeeperState.loading() = _Loading;
  const factory GateKeeperState.authenticated() = _Authenticated;
  const factory GateKeeperState.unAuthenticated() = _UnAuthenticated;
}
