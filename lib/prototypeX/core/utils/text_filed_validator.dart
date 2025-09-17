import 'package:get/get.dart';
import '../values/app_strings.dart';
import '../values/constants/app_regx.dart';

class TextFiledValidator {

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return Keys.Enter_password.tr;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return Keys.Enter_password.tr;
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return Keys.Enter_email.tr;
    }
    if (!RegExp(AppRegex.email).hasMatch(value)) {
      return Keys.Enter_correct_email.tr;
    }
    return null;
  }

  static String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return Keys.Enter_password.tr;
    }

    if (value.length < 8) {
      return Keys.Password_must_be_at_least_8_characters_long.tr;
    }

    if (!RegExp(AppRegex.upperCase).hasMatch(value)) {
      return Keys.Password_must_contain_at_least_one_uppercase_letter.tr;
    }

    if (!RegExp(AppRegex.lowerCase).hasMatch(value)) {
      return Keys.Password_must_contain_at_least_one_lowercase_letter.tr;
    }

    if (!RegExp(AppRegex.digit).hasMatch(value)) {
      return Keys.Password_must_contain_at_least_one_number.tr;
    }

    if (!RegExp(AppRegex.specialChar).hasMatch(value)) {
      return Keys.Password_must_contain_at_least_one_special_character.tr;
    }

    return null;
  }

}
