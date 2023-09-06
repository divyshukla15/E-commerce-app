import 'package:flutter/material.dart';

class MyTheme{
  static ThemeData get themeData =>ThemeData(
        appBarTheme: const AppBarTheme(
          color:Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          
          titleTextStyle: TextStyle(color: Colors.black,
          )
        )
      );
}