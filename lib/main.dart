import 'package:e_coommerce_app/pages/login_page.dart';
import 'package:e_coommerce_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'pages/cart_page.dart';
import 'utils/routes.dart';
import 'pages/home_page.dart';

void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData,
      routes: {
        "/": (context)=>const HomePage(),
        MyRoute.loginRoute :(context) => const LoginPage(),
        MyRoute.homeRoute :(context) =>const HomePage(),
         MyRoute.cartRoute :(context) => const CartPage( )
      },
    );
  }
}