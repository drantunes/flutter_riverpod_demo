import 'package:flutter/material.dart';

class CustomTheme {
  static MaterialColor black = const MaterialColor(
    4280427042,
    {
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919)
    },
  );

  static ButtonStyle get elevatedButtonStyle => ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(fontSize: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ).copyWith(
        elevation: MaterialStateProperty.resolveWith<double>((states) => 0.0),
      );
}
