import 'package:get/get.dart';

class Keys {
  static const String ptypeString = "PtypeString";
  static const String Sign_in = "Sign_In";
  static const String Email = "Email";
  static const String Password = "Password";
  static const String Login = "Login";
  static const String Some_error_occurred = 'Some_error_occurred';
  static const String Enter_email = "Enter_email";
  static const String Enter_correct_email = "Enter_correct_email";
  static const String Enter_password = "Enter_password";
  static const String Password_must_be_at_least_8_characters_long = "Password_must_be_at_least_8_characters_long";
  static const String Password_must_contain_at_least_one_uppercase_letter = "Password_must_contain_at_least_one_uppercase_letter";
  static const String Password_must_contain_at_least_one_lowercase_letter = "Password_must_contain_at_least_one_lowercase_letter";
  static const String Password_must_contain_at_least_one_number = "Password_must_contain_at_least_one_number";
  static const String Password_must_contain_at_least_one_special_character = "Password_must_contain_at_least_one_special_character";
  static const String Create_an_account = "Create_an_account?";
  static const String Sign_up = "SignUp";
  static const String Create_account = "Create account";
  static const String Username = "Username";
  static const String Already_have_an_account = "Already_have_an_account? ";
  static const String You_are_Offline = 'You_are_Offline';
  static const String Please_connect_to_internet = 'Please_connect_to_internet';
  static const String Session_Expired = 'Session_Expired';
  static const String
  Unable_to_process_your_request_due_to_poor_internet_connection =
      'Unable_to_process_your_request_due_to_poor_internet_connection';


}

class AppEngUs {
  static const engUs = {
    Keys.ptypeString: "ProtoType String",
    Keys.Sign_in: "Sign In",
    Keys.Email: "Email",
    Keys.Password: "Password",
    Keys.Login: "Login",
    Keys.Enter_email: "Enter email",
    Keys.Enter_correct_email: "Enter correct email",
    Keys.Enter_password: "Enter password",
    Keys.Password_must_be_at_least_8_characters_long: "Password must be at least 8 characters long",
    Keys.Password_must_contain_at_least_one_uppercase_letter: "Password must contain at least one uppercase letter",
    Keys.Password_must_contain_at_least_one_lowercase_letter: "Password must contain at least one lowercase letter",
    Keys.Password_must_contain_at_least_one_number: "Password must contain at least one number",
    Keys.Password_must_contain_at_least_one_special_character: "Password must contain at least one special character",
    Keys.Create_an_account: "Create an account? ",
    Keys.Create_account: "Create account",
    Keys.Sign_up: "Sign Up",
    Keys.Username: "Username",
    Keys.Already_have_an_account: "Already have an account? ",
    Keys.You_are_Offline: "You are Offline",
    Keys.Please_connect_to_internet: "Please connect to internet",
    Keys.Session_Expired: "Session Expired",
    Keys.Unable_to_process_your_request_due_to_poor_internet_connection: "Unable to process your request due to poor internet connection",
  };
}

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": AppEngUs.engUs,
      };
}
