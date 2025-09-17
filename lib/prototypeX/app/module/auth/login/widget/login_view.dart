import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/module/auth/login/login_screen_controller.dart';
import '../../../../../core/utils/text_filed_validator.dart';
import '../../../../../core/values/app_images.dart';
import '../../../../../core/values/app_sizes.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../widgets/common_button.dart';
import '../../../../widgets/common_rich_text.dart';
import '../../../../widgets/common_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({
    super.key,
    required this.loginCtrl,
  });

  final LoginController loginCtrl;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: loginCtrl.formKey,
          child: Obx(
            () {
              return Column(
                children: [
                  PrimaryTextField(
                    controller: loginCtrl.emailCtrl,
                    node: loginCtrl.emailNode,
                    hintText: Keys.Email.tr,
                    validator: TextFiledValidator.validateEmail,
                  ),
                  SizedBox(height: AppSizes.dimenToPx20),
                  PrimaryTextField(
                    controller: loginCtrl.passCtrl,
                    node: loginCtrl.passNode,
                    hintText: Keys.Password.tr,
                    obscureText: loginCtrl.obscurePass.value,
                    suffixIcon: IconButton(
                      onPressed: loginCtrl.onTap,
                      icon: Image.asset(
                        loginCtrl.obscurePass.value ? AppImages.showIcon : AppImages.hideIcon,
                        width: AppSizes.dimenToPx25,
                        height: AppSizes.dimenToPx25,
                      ),
                    ),
                    validator: TextFiledValidator.validatePassword,
                  )
                ],
              );
            },
          ),
        ),
        SizedBox(height: AppSizes.dimenToPx20),
        CommonButton(
          text: Keys.Login.tr,
          onTap: loginCtrl.login,
        ),
        SizedBox(height: AppSizes.dimenToPx16),
        InlineLinkText(
          prefixText: Keys.Create_an_account.tr,
          linkText: Keys.Sign_up.tr,
          onTap: loginCtrl.navigateToSignUp,
          linkStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
