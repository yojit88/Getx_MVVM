import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/data/service/notification_service.dart';
import 'package:getx_testing/prototypeX/core/values/app_routes_name.dart';

import '../../../../core/utils/logs_helper.dart';
import '../../../data/repository/auth_repository.dart';
import '../../loading/loading.dart';

class LoginController extends GetxController {
  LoginController({this.loginService, this.authRepository});

  @override
  void onInit() {
    super.onInit();
    NotificationService.start();
  }

  LoadingService? loginService;
  AuthRepository? authRepository;

  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final FocusNode emailNode = FocusNode();
  final FocusNode passNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  final RxBool obscurePass = true.obs;

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      loginService?.loading(Get.context!, true);

      var result = await authRepository!.login(
        // email: emailCtrl.text.trim(),
        // password: passCtrl.text.trim(),
        email: "Abc@gmail.com",
        password: "Suthar@123",
      );
      // Perform any custom actions after the API response is received
      loginService?.loading(Get.context!, false);
      logger.e(result.statusCode);
      if (result.statusCode == 201) {
        Get.offAllNamed(AppRoutes.dashBoardScreen);
      }
    }
  }

  void onTap() {
    obscurePass.value = !obscurePass.value;
  }

  void navigateToSignUp() {
    Get.toNamed(AppRoutes.signUpScreen);
  }
}
