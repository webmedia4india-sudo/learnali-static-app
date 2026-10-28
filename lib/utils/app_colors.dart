import 'package:flutter/material.dart';

class AppColors {

  static const Color primary = Color(0xFF55DDE0);

  static const Color blue = Color(0xFF4B5DFF);

  static const Color purple = Color(0xFFB44CFF);

  static const Color pink = Color(0xFFFF6FD8);

  static const Color white = Colors.white;

  static const LinearGradient mainGradient = LinearGradient(
    colors: [
      Color(0xFFFF6FD8),
      Color(0xFF7B61FF),
      Color(0xFF4B5DFF),
      Color(0xFF55DDE0),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}