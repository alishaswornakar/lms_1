import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teaching_lms_adv/core/error/failure.dart';

class ErrorHandler {
  static Failure handleException(dynamic e) {
    if (e is DioException) {
      return _handleDioException(e);
    }

    if (e is SocketException) {
      return const InternetFailure();
    }

    return const SomethingWentWrongFailure();
  }

  static Failure _handleDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const TimeoutFailure();

      case DioExceptionType.connectionError:
        return const InternetFailure();

      case DioExceptionType.badCertificate:
        return const SomethingWentWrongFailure();

      case DioExceptionType.cancel:
        return const SomethingWentWrongFailure();

      case DioExceptionType.badResponse:
        return _handleStatusCode(e.response);

      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return const InternetFailure();
        }

        return const SomethingWentWrongFailure();
    }
  }

  static Failure _handleStatusCode(Response<dynamic>? response) {
    final statusCode = response?.statusCode;
    final message = _extractMessage(response?.data);

    switch (statusCode) {
      case 400:
        return BadRequestFailure(message);

      case 401:
        return const UnauthorizedFailure();

      case 403:
        return const ForbiddenFailure();

      case 404:
        return const NotFoundFailure();

      case 500:
      case 502:
      case 503:
      case 504:
        return ServerFailure(message);

      default:
        return ServerFailure(message);
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data == null) return null;

    if (data is String) {
      return data;
    }

    if (data is List) {
      return data.map((e) => e.toString()).join('\n');
    }

    if (data is Map<String, dynamic>) {
      // Common DRF auth/general error
      final nonFieldErrors = data['non_field_errors'];
      if (nonFieldErrors != null) {
        return _extractMessage(nonFieldErrors);
      }

      // Common DRF detail error
      final detail = data['detail'];
      if (detail != null) {
        return _extractMessage(detail);
      }

      // Custom API formats
      final message = data['message'];
      if (message != null) {
        return _extractMessage(message);
      }

      final error = data['error'];
      if (error != null) {
        return _extractMessage(error);
      }

      // Field validation errors:
      // {
      //   "email": ["This field is required."],
      //   "password": ["This field is required."]
      // }
      final fieldErrors = <String>[];

      data.forEach((key, value) {
        final extracted = _extractMessage(value);

        if (extracted != null && extracted.trim().isNotEmpty) {
          fieldErrors.add('$key: $extracted');
        }
      });

      if (fieldErrors.isNotEmpty) {
        return fieldErrors.join('\n');
      }
    }

    return null;
  }
}
