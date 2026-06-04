class ProfileModel {
  final String id;
  final String username;
  final String name;
  final String email;
  final List<String> roles;
  final bool hasTrainerProfile;

  ProfileModel({
    required this.id,
    required this.username,
    required this.name,
    required this.email,
    required this.roles,
    required this.hasTrainerProfile,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      roles: List<String>.from(json['roles'] ?? []),
      hasTrainerProfile: json['has_trainer_profile'] ?? false,
    );
  }
}