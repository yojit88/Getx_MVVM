 import 'dart:convert';

SignupModel signupModelFromJson(String str) => SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  String message;
  bool success;
  String userId;
  String token;

  SignupModel({
    required this.message,
    required this.success,
    required this.userId,
    required this.token,
  });

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
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
