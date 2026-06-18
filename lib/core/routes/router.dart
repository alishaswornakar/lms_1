
// import 'package:go_router/go_router.dart';
// import 'package:teaching_lms_adv/core/routes/route_name.dart';
// import 'package:teaching_lms_adv/features/auth/pages/login_page.dart';
// import 'package:teaching_lms_adv/features/home/pages/home_page.dart';
// import 'package:teaching_lms_adv/features/trainer/pages/apply_trainer.dart';
// import 'package:teaching_lms_adv/features/user_profile/pages/profile_page.dart';

// class AppRoute {
//   static final GoRouter router = GoRouter(
//     initialLocation: RouteName.splash.path,


//       routes: [
//         // Login Route
//         GoRoute(
//           path: RouteName.login.path,
//           name: RouteName.login,
//           builder: (context, state) => const LoginPage(),
//         ),

//         // Home Route
//         GoRoute(
//           path: RouteName.home.path,
//           name: RouteName.home,
//           builder: (context, state) {
//             final email = state.extra as String? ?? '';

//             return HomePage(
//               email: email,
//             );
//           },
//         ),

//         GoRoute(
//           path: RouteName.profileMe.path,
//           name: RouteName.profileMe,
//          builder: (context, state) => const ProfilePage(),
//               ),

//          GoRoute(
//           path: RouteName.trainerApply.path,
//           name: RouteName.trainerApply,
//           builder: (context, state) => const TrainerApplyPage(),
//         ),
//       ],
//     );
//           }
       
import 'package:go_router/go_router.dart';
import 'package:teaching_lms_adv/core/pages/splash.dart';

import 'package:teaching_lms_adv/core/routes/route_name.dart';
import 'package:teaching_lms_adv/features/auth/pages/login_page.dart';
import 'package:teaching_lms_adv/features/courses/pages/create_course.dart';
import 'package:teaching_lms_adv/features/home/pages/home_page.dart';

import 'package:teaching_lms_adv/features/trainer/pages/apply_trainer.dart';
import 'package:teaching_lms_adv/features/user_profile/pages/profile_page.dart';

class AppRoute {
  static final GoRouter router = GoRouter(
    initialLocation: RouteName.splash.path,

    routes: [
      GoRoute(
        path: RouteName.splash.path,
        name: RouteName.splash,

        builder: (context, state) {
          return SplashPage();
        },
      ),

      GoRoute(
        path: RouteName.home.path,
        name: RouteName.home,

        builder: (context, state) {
          return HomePage(email: '',);
        },
      ),

      GoRoute(
        path: RouteName.login.path,
        name: RouteName.login,

        builder: (context, state) {
          return LoginPage();
        },
      ),

      GoRoute(
        path: RouteName.profileMe.path,
        name: RouteName.profileMe,

        builder: (context, state) {
          return ProfilePage();
        },
      ),

      GoRoute(
        path: RouteName.trainerApply.path,
        name: RouteName.trainerApply,

        builder: (context, state) {
          return TrainerApplyPage();
        },
      ),

      GoRoute(
        path: RouteName.createCourseFormPage.path,
        name: RouteName.createCourseFormPage,

        builder: (context, state) {
          return CreateCourseFormPage();
        },
      ),
    ],
  );
}
