import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showNackbar(
    {required String message,
    required Color bgColor,
    required Duration duration}) {
  Get.showSnackbar(GetSnackBar(
      borderRadius: 20,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      duration: duration,
      snackPosition: SnackPosition.TOP,
      message: message,
      backgroundColor: bgColor));
}
