import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sample/app/data/values/strings.dart';

class APIException implements Exception {
  final String message;

  APIException({required this.message});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(message: ErrorMessages.noInternet);
        case DioErrorType.connectionTimeout:
          return APIException(message: ErrorMessages.connectionTimeout);
        case DioErrorType.badResponse:
          return APIException(message: ErrorMessages.unauthorized);
        default:
          return APIException(message: ErrorMessages.networkGeneral);
      }
    } else {
      return APIException(message: ErrorMessages.networkGeneral);
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError({APIException? error}) {
    Get.rawSnackbar(message: error?.message ?? ErrorMessages.networkGeneral);
  }
}
