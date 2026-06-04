import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:teaching_lms_adv/core/routes/route_name.dart';
import 'package:teaching_lms_adv/features/auth/pages/login_page.dart';
import 'package:teaching_lms_adv/features/home/pages/home_page.dart';
import 'package:teaching_lms_adv/features/user_profile/pages/profile_page.dart';

class AppRoute {
  static GoRouter router() {
    return GoRouter(
      initialLocation: RouteName.login.path,

      routes: [
        // Login Route
        GoRoute(
          path: RouteName.login.path,
          name: RouteName.login,
          builder: (context, state) => const LoginPage(),
        ),

        // Home Route
        GoRoute(
          path: RouteName.home.path,
          name: RouteName.home,
          builder: (context, state) {
            final email = state.extra as String? ?? '';

            return HomePage(
              email: email,
            );
          },
        ),

        GoRoute(
          path: RouteName.profileMe.path,
          name: RouteName.profileMe,
         builder: (context, state) => const ProfilePage(),
              ),
      ],
    );
          }
       
}