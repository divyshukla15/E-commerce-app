import 'package:e_coommerce_app/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'pages/home_page.dart';
// import 'pages/home_page.dart';
void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=>LoginPage(),
        MyRoute.loginRoute :(context) => LoginPage(),
        MyRoute.homeRoute :(context) =>HomePage()
      },
    );
  }
}