import 'package:flutter/material.dart';

//import '../utils/colors.dart';

class MyTheme {
  static ThemeData get themeData => ThemeData(
      appBarTheme: const AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
          )),
   
     primarySwatch: Colors.green
      //Color.fromARGB(255, 3, 111, 66)
      );
}
