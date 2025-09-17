import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String message;
  bool success;
  String userId;
  String token;

  LoginModel({
    required this.message,
    required this.success,
    required this.userId,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    message: json["message"],
    success: json["success"],
    userId: json["userId"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "userId": userId,
    "token": token,
  };
}
