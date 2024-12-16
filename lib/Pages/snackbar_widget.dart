import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar({
  required String title,
  required String message,
  required MaterialColor textColor,
}) {
  // Validate required parameters
  // ignore: unnecessary_null_comparison
  if (title.isEmpty || message.isEmpty || textColor == null) {
    throw Exception('All parameters (title, message, textColor) are required.');
  }

  Get.snackbar(
    title, // Pass title as the first positional argument
    message, // Pass message as the second positional argument
    snackPosition: SnackPosition.BOTTOM, // Position at the bottom
    margin: EdgeInsets.only(right: 10 , left: 10 , bottom: 40), // Optional: Add margin
    colorText: textColor, // Set the text color
    backgroundColor: Colors.transparent, // Optional: Set background color
    borderRadius: 8, // Optional: Set border radius
    duration: Duration(seconds: 3), // Optional: Set duration
  );
}