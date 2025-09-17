import 'dart:convert';

import 'package:getx_testing/prototypeX/core/data/api_response_model.dart';
import 'package:getx_testing/prototypeX/core/extensions/dio_extensions.dart';
import 'package:getx_testing/prototypeX/core/values/constants/server_endpoints.dart';
import '../../../../core/values/constants/api_fields.dart';
import '../../clients/dio_remote_api_client.dart';
import 'auth_remote_service.dart';

class DioAuthService implements AuthRemoteService {
  DioRemoteApiClient dioRemoteApiClient;

  DioAuthService({required this.dioRemoteApiClient});

  @override
  Future<ApiResponseModel> login({
    required String email,
    required String password,
  }) async {
    var param = {
      ApiFields.email: email,
      ApiFields.password: password,
    };
    return dioRemoteApiClient.apiClient.safeApiCall(
      request: () => dioRemoteApiClient.apiClient.post(
        ApiEndpoints.login,
        data: json.encode(param),
      ),
      useDefaultErrorHandler: true,
    );
  }

  @override
  Future<ApiResponseModel> signup({
    required String username,
    required String email,
    required String password,
  }) async {
    var param = {
      ApiFields.username: username,
      ApiFields.email: email,
      ApiFields.password: password,
    };
    return dioRemoteApiClient.apiClient.safeApiCall(
      request: () => dioRemoteApiClient.apiClient.post(
        ApiEndpoints.signup,
        data: json.encode(param),
      ),
      useDefaultErrorHandler: true,
    );
  }
}
