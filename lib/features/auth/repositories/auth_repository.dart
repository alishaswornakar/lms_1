// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:teaching_lms_adv/core/models/token_storage_model.dart';
import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/storage/token_storage.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';

abstract class AuthRepository {
  FutureEither<String> login({required String email, required String password});
}

class AuthRepositoryImpl implements AuthRepository {
  final ApiService apiService;
  final TokenStorageService tokenStorageService;

  AuthRepositoryImpl({
    required this.apiService,
    required this.tokenStorageService,
  });
  @override
  FutureEither<String> login({
    required String email,
    required String password,
  }) async {
    final result = await apiService.post(
      "auth/login/",
      data: {"email": email, "password": password},
    );

    return await result.fold((l) => Left(l), (json) async {
      await tokenStorageService.saveTokens(
        TokenStorageModel.fromMap(json['token']),
      );
      return Right("Login successful ${json.runtimeType}");
    });
  }
}
