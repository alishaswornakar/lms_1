class RouteName {
  static const String home = "home";
  static const String login = "login";
  static const String profileMe = "profile-me";
}

extension Path on String {
  String get path => "/$this";
}
