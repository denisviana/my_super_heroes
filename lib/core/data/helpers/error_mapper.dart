import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../model/app_exception.dart';

class ErrorMapper {
  static AppException from(dynamic e) => e is DioError
        ? AppException(
            exception: e,
            description: _dioError(e),
          )
        : e is PlatformException
            ? AppException(exception: e, description: e.message)
            : e is NoSuchMethodError
                ? AppException(exception: e, description: '')
                : e is AppException
                    ? e
                    : e is NoSuchMethodError
                        ? AppException(
                            exception: null,
                            description: '',
                          )
                        : AppException(
                            exception: e,
                            description: e.toString(),
                          );

  static String _dioError(DioError error) {
    switch (error.type) {
      case DioErrorType.sendTimeout:
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
        return 'Time out';
      case DioErrorType.cancel:
        return 'Request canceled';
      case DioErrorType.response:
      default:
        break;
    }
    if (error.response?.statusCode != null) {
      final Map<String, dynamic> data = error.response?.data is Map ? error.response?.data : null;
      switch (error.response?.statusCode) {
        case 400:
          return 'Bad request';
        case 401:
          return 'Not authorized';
        case 403:
          return 'Not authorized';
        case 404:
          return 'Not found';
        case 500:
        case 501:
        case 502:
          return 'Internal error';
        case 503:
          return 'Unexpected error';
        default:
          break;
      }
      if (data.containsKey('message') && data['message'] != null) {
        return data['message'] ?? '';
      }
    }
    return 'Unexpected error';
  }
}
