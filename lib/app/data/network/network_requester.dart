import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample/app/data/models/dto/user.dart';
import 'package:sample/app/data/values/constants.dart';
import 'package:sample/app/data/values/env.dart';
import 'package:sample/app/data/values/urls.dart';
import 'package:sample/app/modules/auth/start/views/auth_start_view.dart';
import 'package:sample/utils/helper/exception_handler.dart';
import 'package:sample/utils/loading/loading_utils.dart';
import 'package:sample/utils/storage/storage_utils.dart';

class NetworkRequester {
  late Dio _dio;

  NetworkRequester() {
    prepareRequest();
  }

  void prepareRequest() {
    User? user = Storage.getUser();

    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: Timeouts.CONNECT_TIMEOUT),
      receiveTimeout: const Duration(milliseconds: Timeouts.RECEIVE_TIMEOUT),
      baseUrl: Env.baseURL,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
        HttpHeaders.contentTypeHeader: Headers.jsonContentType,
        HttpHeaders.authorizationHeader:
            user == null ? "" : "Bearer ${user.token}"
      },
    );

    _dio = Dio(dioOptions);

    _dio.interceptors.clear();

    _dio.interceptors.addAll({
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        logPrint: _printLog,
      ),
      InterceptorsWrapper(
        onResponse: (Response response, handler) {
          // Check for 400 status code
          if (response.statusCode! == 401) {
            handle400Error(user, response);
          }

          return handler.next(response);
        },
        onError: (DioError dioError, handler) {
          // Check for 400 status code
          if (dioError.response!.statusCode! == 401) {
            // Handle the 400 error
            handle400Error(user, dioError.response!);
          }

          return handler.next(dioError);
        },
      )
    });
  }

  void handle400Error(User? user, Response errorResponse) async {
    try {
      LoadingUtils.showLoader();
      final response = await post(
          path: URLs.refresh_token, data: {"refreshToken": user?.refreshToken});
      LoadingUtils.hideLoader();
      if (response is Response &&
          (response.statusCode! >= 200 && response.statusCode! < 300)) {
        Storage.setUser(User.fromJson(response.data));
        prepareRequest();
      } else {
        _dio.interceptors.clear();
        Storage.clearAllData();
        AuthStartView.launch();
      }
    } on Exception catch (exception) {
      _dio.interceptors.clear();
      Storage.clearAllData();
      AuthStartView.launch();
    }
  }

  _printLog(Object object) => log(object.toString());

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? query,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers?.forEach((key, value) {
        _dio.options.headers[key] = value;
      });
      final response = await _dio.get(path, queryParameters: query, data: data);
      return response;
    } on Exception catch (exception) {
      return ExceptionHandler.handleError(exception);
    }
  }

  Future<dynamic> post({
    required String path,
    Map<String, dynamic>? query,
    Object? data,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers?.forEach((key, value) {
        _dio.options.headers[key] = value;
      });
      final response = await _dio.post(
        path,
        queryParameters: query,
        data: data,
      );
      return response;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> put({
    required String path,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    try {
      final response = await _dio.put(path, queryParameters: query, data: data);
      return response;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> patch({
    required String path,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    try {
      final response =
          await _dio.patch(path, queryParameters: query, data: data);
      return response;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }

  Future<dynamic> delete({
    required String path,
    Map<String, dynamic>? query,
    Object? data,
  }) async {
    try {
      final response =
          await _dio.delete(path, queryParameters: query, data: data);
      return response;
    } on Exception catch (error) {
      return ExceptionHandler.handleError(error);
    }
  }
}
