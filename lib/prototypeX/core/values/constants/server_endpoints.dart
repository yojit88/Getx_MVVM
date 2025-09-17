import '../../../env/env.dart';

/// Server endpoints for different environments (local, dev, staging, prod).
class ServerEndpoints {
  static const String localhost = "Env.localhost";
  static const String devUrl = Env.devUrl;
  static const String stagingUrl = "Env.stagingUrl";
  static const String prodUrl = "Env.prodUrl";
  static const String mockTestUrl = "https://httpstat.us/502";
}

/// API endpoints built using the base URL and grouped by feature (auth, common, etc.).
class ApiEndpoints {
  // Base
  static String baseURL = ServerEndpoints.devUrl;

  // Auth
  static String prefixAuth = '$baseURL/user';
  static String login = '$prefixAuth/login';
  static String signup = '$prefixAuth/signUp';

  // Common
  static String prefixCommon = '$baseURL/common';
  static String saveFCMToken = '$prefixCommon/saveFCMToken';
}
