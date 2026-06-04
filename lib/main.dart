import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teaching_lms_adv/core/di/di_init.dart';
import 'package:teaching_lms_adv/core/routes/router.dart';
import 'package:teaching_lms_adv/core/theme/theme_mode.dart';
import 'package:teaching_lms_adv/features/auth/blocs/login/login_bloc.dart';
import 'package:teaching_lms_adv/features/user_profile/bloc/profile/profile_me_bloc.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<LoginBloc>()),
        BlocProvider(create: (context) => sl<ProfileBloc>()), 
        // BlocProvider(create: (context) => SubjectBloc()),
      ],
      child: MaterialApp.router(
        title: 'LMS App',
        debugShowCheckedModeBanner: false,
        theme: AppThemeMode.lightTheme(context),
        darkTheme: AppThemeMode.darkTheme(context),
        themeMode: ThemeMode.system,
        routerConfig: AppRoute.router(),
      ),
    );
  }
}
