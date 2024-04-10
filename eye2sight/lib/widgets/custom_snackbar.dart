import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  static String error = 'erorr';
  static String success = 'success';
  static String other = 'other';
  static showSnackBar(title, String message, type) {
    if (Get.context != null) {
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
      return ScaffoldMessenger.of(Get.context!)
          .showSnackBar(SnackBar(content: Text(message)));
    }
  }
}
