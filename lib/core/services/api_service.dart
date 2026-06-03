import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:teaching_lms_adv/core/error/error_handler.dart';
import 'package:teaching_lms_adv/core/network/dio_client.dart';
import 'package:teaching_lms_adv/core/typedef/either.dart';

class ApiService {
  final DioClient _dioClient;
  late Dio _dio;
  ApiService(this._dioClient) {
    _dio = _dioClient.dio;
  }

  FutureEither<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }

  FutureEither<T> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic)? fromJson,
  }) async {
    try {
      final Response response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return Right(
        fromJson != null ? fromJson(response.data) : response.data as T,
      );
    } catch (e) {
      return Left(ErrorHandler.handleException(e));
    }
  }
}
