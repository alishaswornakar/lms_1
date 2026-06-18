import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:teaching_lms_adv/core/blocs/gate_keeper/gate_keeper_cubit.dart';

import 'package:teaching_lms_adv/core/routes/route_name.dart';
import 'package:teaching_lms_adv/core/widgets/progrss_indicator.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() {
    context.read<GateKeeperCubit>().getStatus();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GateKeeperCubit, GateKeeperState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: () => context.goNamed(RouteName.home),
            unAuthenticated: () => context.goNamed(RouteName.login),
          );
        },
        child: AppLoading(),
      ),
    );
  }
}
