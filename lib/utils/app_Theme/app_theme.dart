import 'package:flutter/material.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
      appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50))),
    backgroundColor: Colors.green,
  ));
}
