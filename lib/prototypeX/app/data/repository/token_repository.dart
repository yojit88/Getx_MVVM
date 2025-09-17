import 'package:get/get.dart';
import 'package:synchronized/synchronized.dart';
import '../../../core/utils/shared_prefrences_helper.dart';

class TokenRepository extends GetxService {
  var isNewIdToken = false;
  final _tokenLock = Lock();

  void saveIdToken(String token) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.addIdToken, token);
  }

  /// Returns the ID token in a thread-safe way.
  /// Add logic inside the synchronized block to fetch or refresh the token.
  Future<String?> getIdToken() async {
    return await _tokenLock.synchronized(() async {
      // Example: fetch from storage or refresh if expired
    });
  }

  void deleteIdToken() async {
    await SharedPreferenceHelper.remove(PreferenceKeys.addIdToken);
  }

  void saveRefreshToken(String token) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.addRefreshToken, token);
  }

  String? getRefreshToken() {
    return SharedPreferenceHelper.getString(PreferenceKeys.addRefreshToken);
  }

  Future<void> deleteRefreshToken() async {
    await SharedPreferenceHelper.remove(PreferenceKeys.addRefreshToken);
  }

  void saveAccessToken(String token) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.addAccessToken, token);
  }

  String? getAccessToken() {
    return SharedPreferenceHelper.getString(PreferenceKeys.addAccessToken);
  }

  void deleteAccessToken() async {
    await SharedPreferenceHelper.remove(PreferenceKeys.addAccessToken);
  }
}
