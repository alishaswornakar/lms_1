import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:teaching_lms_adv/core/network/api_url.dart';
import 'package:teaching_lms_adv/core/network/dio_client.dart';
import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/storage/token_storage.dart';
import 'package:teaching_lms_adv/features/auth/blocs/login/login_bloc.dart';
import 'package:teaching_lms_adv/features/auth/repositories/auth_repository.dart';

final sl = GetIt.instance;

void init() {
  //bloc

  sl.registerLazySingleton(() => LoginBloc(authRepository: sl()));

  //repo
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl(), tokenStorageService: sl()),
  );

  //core

  sl.registerLazySingleton(() => TokenStorageService(sl()));
  
  sl.registerLazySingleton(() => ApiService(sl()));

  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: kBaseUrl)));

  sl.registerLazySingleton(() => FlutterSecureStorage());
}
