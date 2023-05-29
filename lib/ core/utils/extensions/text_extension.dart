import 'package:flutter/material.dart';

extension ThemeText on TextTheme {
  //HEADER 3
  TextStyle get header3 =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w300);
  TextStyle get header3Regular =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle get header3Medium =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle get header3SemiBold =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  TextStyle get header3Bold =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle get titleText =>
      const TextStyle(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle get titleMediumText =>
      const TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
}
