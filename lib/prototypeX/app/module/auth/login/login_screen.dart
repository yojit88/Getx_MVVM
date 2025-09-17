import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../loading/loading.dart';
import 'login_screen_controller.dart';
import 'widget/login_view.dart';
import 'package:getx_testing/prototypeX/app/data/repository/auth_repository.dart';
import 'package:getx_testing/prototypeX/app/data/service/auth/dio_auth_service.dart';
import '../../../../core/values/values.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController loginCtrl = Get.put(
    LoginController(
      loginService: Get.find<LoadingService>(),
      authRepository: AuthRepository(
        authRemoteService: DioAuthService(
          dioRemoteApiClient: Get.find(),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Keys.Sign_in.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.dimenToPx16),
        child: LoginView(
          loginCtrl: loginCtrl,
        ),
      ),
    );
  }
}
