import 'package:getx_testing/prototypeX/core/data/api_response_model.dart';

abstract class AuthRemoteService {
  Future<ApiResponseModel> login({
    required String email,
    required String password,
  });

  Future<ApiResponseModel> signup({
    required String username,
    required String email,
    required String password,
  });
}
