// Class containing reusable regex patterns for validation
class AppRegex{
  static const String email =r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static const String upperCase = r'[A-Z]';
  static const String lowerCase = r'[a-z]';
  static const String digit = r'[0-9]';
  static const String specialChar = r'[!@#\$&*~]';
}