class RouteName {
  static const String splash = "splash";
  static const String home = "home";
  static const String login = "login";
  static const String profileMe = "profile-me";
  static const String trainerApply = "trainer-apply";
  static const String trainerProfile = "trainer-profile";
 static const String createCourseFormPage = "create-course";
  static const String category = "category";
}

extension Path on String {
  String get path => "/$this";
}
