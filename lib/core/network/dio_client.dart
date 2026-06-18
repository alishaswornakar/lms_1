// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'package:teaching_lms_adv/core/storage/token_storage.dart';

class DioClient {
  final Dio _dio;
  final AuthTokenInterceptor _authTokenInterceptor;

  DioClient(this._dio, this._authTokenInterceptor) {
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(_authTokenInterceptor);
  }

  Dio get dio => _dio;
}

class AuthTokenInterceptor extends Interceptor {
  final TokenStorageService _tokenStorageService;

  AuthTokenInterceptor({required TokenStorageService tokenStorageService})
    : _tokenStorageService = tokenStorageService;
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = await _tokenStorageService.getAccessToken();
    options.headers['Authorization'] = "Bearer $accessToken";
    super.onRequest(options, handler);
  }
}
