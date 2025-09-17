import 'package:getx_testing/prototypeX/app/data/service/auth/auth_remote_service.dart';
import 'package:getx_testing/prototypeX/core/data/api_response_model.dart';

class AuthRepository {
  final AuthRemoteService authRemoteService;

  AuthRepository({required this.authRemoteService});

  Future<ApiResponseModel> login({required String email, required String password}) async {
    return await authRemoteService.login(email: email, password: password);
  }

  Future<ApiResponseModel> signup({required String username, required String email, required String password}) async {
    return await authRemoteService.signup(username: username, email: email, password: password);
  }
}
