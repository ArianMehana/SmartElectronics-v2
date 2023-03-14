import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

ThemeData themeData(){
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "Muli",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: 42,
            vertical: 20),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder());
}

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
          borderRadius: BorderRadius.circular(28),
          borderSide: BorderSide(color: kTextColor),
          gapPadding: 10);
}

TextTheme textTheme() {
  return TextTheme(
        bodyLarge: TextStyle(color: kTextColor),
        bodyMedium: TextStyle(color: kTextColor)
    );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
        color: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.light
        ),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Color(0xFF8B8B8B),
            fontSize: 18.0
        )
    );
}