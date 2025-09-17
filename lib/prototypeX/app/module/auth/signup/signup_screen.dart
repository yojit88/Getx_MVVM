import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/data/repository/auth_repository.dart';
import 'package:getx_testing/prototypeX/app/data/service/auth/dio_auth_service.dart';
import 'package:getx_testing/prototypeX/app/module/auth/signup/signup_screen_controller.dart';
import '../../loading/loading.dart';
import 'widget/signup_view.dart';
import '../../../../core/values/values.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignUpController signUpCtrl = Get.put(
    SignUpController(
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
        title: Text(Keys.Create_account.tr),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.dimenToPx16),
        child: SignupView(
          signUpCtrl: signUpCtrl,
        ),
      ),
    );
  }
}
