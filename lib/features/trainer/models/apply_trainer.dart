class TrainerApplicationModel {
  final String bio;
  final String expertise;
  final int experienceYears;

  const TrainerApplicationModel({
    required this.bio,
    required this.expertise,
    required this.experienceYears,
  });

  Map<String, dynamic> toJson() {
    return {
      'bio': bio,
      'expertise': expertise,
      'experience_years': experienceYears,
    };
  }

  factory TrainerApplicationModel.fromJson(Map<String, dynamic> json) {
    return TrainerApplicationModel(
      bio: json['bio'] ?? '',
      expertise: json['expertise'] ?? '',
      experienceYears: json['experience_years'] ?? 0,
    );
  }
}