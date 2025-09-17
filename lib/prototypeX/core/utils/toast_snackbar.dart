import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ToastSnackBar {
  static void fieldsFocusChange(BuildContext context, FocusNode currentNode, FocusNode next) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus();
  }

  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static snackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
    );
  }
}
