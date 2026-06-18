import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:teaching_lms_adv/core/blocs/gate_keeper/gate_keeper_cubit.dart';
import 'package:teaching_lms_adv/core/network/api_url.dart';
import 'package:teaching_lms_adv/core/network/dio_client.dart';
import 'package:teaching_lms_adv/core/services/api_service.dart';
import 'package:teaching_lms_adv/core/storage/token_storage.dart';
import 'package:teaching_lms_adv/features/auth/blocs/login/login_bloc.dart';
import 'package:teaching_lms_adv/features/auth/repositories/auth_repository.dart';
import 'package:teaching_lms_adv/features/courses/blocs/create_course/course_create_bloc.dart';
import 'package:teaching_lms_adv/features/courses/blocs/category_bloc/category_bloc.dart';
import 'package:teaching_lms_adv/features/courses/repositories/category_repository.dart';
import 'package:teaching_lms_adv/features/courses/repositories/course_repository.dart';
import 'package:teaching_lms_adv/features/trainer/bloc/apply_trainer/apply_trainer_bloc.dart';
import 'package:teaching_lms_adv/features/trainer/repository/apply_trainer.dart';
import 'package:teaching_lms_adv/features/user_profile/bloc/profile/profile_me_bloc.dart';
import 'package:teaching_lms_adv/features/user_profile/repository/profile_repo.dart';

final sl = GetIt.instance;

void init() {
  //bloc

  sl.registerLazySingleton(() => LoginBloc(authRepository: sl()));
  sl.registerLazySingleton(() => ProfileBloc(sl()));  
  sl.registerLazySingleton(() => TrainerApplyBloc(repository: sl()));
  sl.registerLazySingleton(() => GateKeeperCubit(sl()));
  sl.registerLazySingleton(() => CourseCreateBloc(repo: sl()));
  sl.registerLazySingleton(() => CategoryBloc(repo: sl()));


  //repo
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(apiService: sl(), tokenStorageService: sl()),
  );
   sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepository(sl<ApiService>()),
  );
  sl.registerLazySingleton<TrainerRepository>(
    () => TrainerRepository(sl<ApiService>()),
  );
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(apiService: sl()),
  );

  sl.registerLazySingleton<CourseRepository>(
    () => CourseRepositoryImpl(apiService: sl()),
  );



  //core

  sl.registerLazySingleton(() => TokenStorageService(sl()));
  
  sl.registerLazySingleton(() => ApiService(sl()));

  sl.registerLazySingleton(() => DioClient(sl(), sl()));

  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: kBaseUrl)));
   sl.registerLazySingleton(
    () => AuthTokenInterceptor(tokenStorageService: sl()),
  );
  

  sl.registerLazySingleton(() => FlutterSecureStorage());
}

