import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Colors.indigo;
  static const Color primaryColorAccent = Colors.indigoAccent;
  static const Color grey = Colors.grey;

  static var kResultTextStyle =
      TextStyle(fontSize: 40, color: Colors.grey[900]);
  static const bigTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 50,
    color: AppColors.primaryColor,
  );

  static final Shader linearGradient = const LinearGradient(
    colors: <Color>[
      Color.fromARGB(255, 237, 94, 242),
      Color.fromARGB(255, 118, 0, 151)
    ],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
