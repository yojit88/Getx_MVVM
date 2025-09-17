import '../../../core/utils/shared_prefrences_helper.dart';

class UserRepository {
  setUserId(int? id) async {
    return await SharedPreferenceHelper.setInt(PreferenceKeys.userId, id ?? 0);
  }

  int? getUserId() {
    return SharedPreferenceHelper.getInt(PreferenceKeys.userId);
  }

  setUserName(String? userName) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.userName, userName ?? "");
  }

  String? getUserName() {
    return SharedPreferenceHelper.getString(PreferenceKeys.userName);
  }

  setUserEmail(String? userEmail) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.userEmail, userEmail ?? "");
  }

  String? getUserEmail() {
    return SharedPreferenceHelper.getString(PreferenceKeys.userEmail);
  }

  setUserStatus(int? userStatus) async {
    await SharedPreferenceHelper.setInt(PreferenceKeys.userStatus, userStatus ?? 0);
  }

  int? getUserStatus() {
    return SharedPreferenceHelper.getInt(PreferenceKeys.userStatus);
  }

  setDeviceId(String? deviceId) async {
    await SharedPreferenceHelper.setString(PreferenceKeys.deviceId, deviceId ?? "");
  }

  String? getDeviceId() {
    return SharedPreferenceHelper.getString(PreferenceKeys.deviceId);
  }

  setUserDetail(String? data) async {
    if (data == null) {
      return;
    }
    try {
      await SharedPreferenceHelper.setString(PreferenceKeys.userDetailEncrypted, data);
    } catch (e) {}
  }

  String? getUserDetail() {
    try {
      return SharedPreferenceHelper.getString(PreferenceKeys.userDetailEncrypted);
    } catch (e) {
      return null;
    }
  }
}
