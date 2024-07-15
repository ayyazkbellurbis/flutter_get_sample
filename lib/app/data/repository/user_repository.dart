import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:sample/app/data/models/dto/api_response.dart';
import 'package:sample/app/data/values/urls.dart';
import 'package:sample/app/modules/auth/start/entity/log_in_entity.dart';
import 'package:sample/base/base_repository.dart';
import 'package:sample/utils/storage/storage_utils.dart';

class UserRepository extends BaseRepository {
  Future<ApiResponse<LogInEntity>> logInUser({
    required String userName,
    required String password,
    required String lat,
    required String long,
  }) async {
    try {
      var body = jsonEncode({
        "userName": userName,
        "password": password,
        "lat": lat,
        "long": long
      });
      Response response = await controller.post(
          path: URLs.log_in,
          data: body,
          headers: {HttpHeaders.contentTypeHeader: Headers.jsonContentType});

      if (response.statusCode == 200) {
        // print("vivz ${response.data}");
        LogInEntity logInEntity = LogInEntity.fromJson(response.data);
        return ApiResponse<LogInEntity>(success: true, data: logInEntity);
      } else {
        // Handle the error response
        return ApiResponse<LogInEntity>(success: false, data: response.data);
      }
    } catch (e) {
      // Handle Dio errors or other exceptions
      return ApiResponse<LogInEntity>(
          success: false, errorMessage: e.toString());
    }
  }

  String? getLanguage() {
    return Storage.getLanguage();
  }
}
