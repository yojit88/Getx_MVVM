import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/utils/logs_helper.dart';
import '../../../../core/values/app_routes_name.dart';
import '../../../data/repository/auth_repository.dart';
import '../../loading/loading.dart';

class SignUpController extends GetxController {
  SignUpController({this.loginService, this.authRepository});

  LoadingService? loginService;
  AuthRepository? authRepository;
  final TextEditingController userNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  final FocusNode userFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final RxBool obscurePass = true.obs;
  final formKey = GlobalKey<FormState>();

  void onTap() {
    obscurePass.value = !obscurePass.value;
  }

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      logger.f("Success");
      var result = await authRepository!.signup(
        username: userNameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );
    } else {
      logger.f("Fail");
    }
  }

  void navigateToLogin() {
    Get.offAllNamed(AppRoutes.loginScreen);
  }
}
