import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController successMessage(String message) {
  return Get.snackbar("Success",
  message,
      // borderWidth: 1,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      // borderColor: Colors.green[300],
      backgroundColor: Color.fromRGBO(255, 255, 255, .6),
      icon: Icon(
        Icons.info,
        color: Colors.green[700],
        size: 40,
      ),
      snackStyle: SnackStyle.FLOATING,
      snackPosition: SnackPosition.TOP,
      barBlur: 10);
}