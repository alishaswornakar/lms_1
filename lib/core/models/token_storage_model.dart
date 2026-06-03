class TokenStorageModel {
  final String accessToken;
  final String refreshToken;
  TokenStorageModel({required this.accessToken, required this.refreshToken});

  factory TokenStorageModel.fromMap(Map<String, dynamic> map) {
    return TokenStorageModel(
      accessToken: map['access'] ?? map['access_token'],
      refreshToken: map['refresh'] ?? map['refresh_token'],
    );
  }
}
