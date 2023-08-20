import 'package:flutter/material.dart';
import 'package:front/colors/app_colors.dart';
import 'package:get/get.dart';

class Message {
  static void taskErrorOrWarning(String name, String message) {
    Get.snackbar(
      name,
      message,
      backgroundColor: AppColors.mainColor,
      titleText: Text(
        name,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }
}
