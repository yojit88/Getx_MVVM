import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_testing/prototypeX/app/module/auth/signup/signup_screen_controller.dart';
import 'package:getx_testing/prototypeX/app/widgets/common_button.dart';
import 'package:getx_testing/prototypeX/app/widgets/common_text_field.dart';
import 'package:getx_testing/prototypeX/core/values/app_sizes.dart';
import '../../../../../core/utils/text_filed_validator.dart';
import '../../../../../core/values/app_images.dart';
import '../../../../../core/values/app_strings.dart';
import '../../../../widgets/common_rich_text.dart';

class SignupView extends StatelessWidget {
  const SignupView({
    super.key,
    required this.signUpCtrl,
  });

  final SignUpController signUpCtrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () {
            return Form(
              key: signUpCtrl.formKey,
              child: Column(
                children: [
                  PrimaryTextField(
                    controller: signUpCtrl.userNameCtrl,
                    node: signUpCtrl.userFocus,
                    hintText: Keys.Username.tr,
                    validator: TextFiledValidator.validateUserName,
                  ),
                  SizedBox(height: AppSizes.dimenToPx20),
                  PrimaryTextField(
                    controller: signUpCtrl.emailCtrl,
                    node: signUpCtrl.emailFocus,
                    hintText: Keys.Email.tr,
                    validator: TextFiledValidator.validateEmail,
                  ),
                  SizedBox(height: AppSizes.dimenToPx20),
                  PrimaryTextField(
                    controller: signUpCtrl.passCtrl,
                    node: signUpCtrl.passwordFocus,
                    hintText: Keys.Password.tr,
                    obscureText: signUpCtrl.obscurePass.value,
                    suffixIcon: IconButton(
                      onPressed: signUpCtrl.onTap,
                      icon: Image.asset(
                        signUpCtrl.obscurePass.value ? AppImages.showIcon : AppImages.hideIcon,
                        width: AppSizes.dimenToPx25,
                        height: AppSizes.dimenToPx25,
                      ),
                    ),
                    validator: TextFiledValidator.validateStrongPassword,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: AppSizes.dimenToPx16),
        CommonButton(
          text: Keys.Sign_up.tr,
          onTap: signUpCtrl.signUp,
        ),
        SizedBox(height: AppSizes.dimenToPx15),
        InlineLinkText(
          prefixText: Keys.Already_have_an_account.tr,
          linkText: Keys.Sign_in.tr,
          onTap: signUpCtrl.navigateToLogin,
          linkStyle: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
