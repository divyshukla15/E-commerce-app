import 'package:flutter/material.dart';



// ignore: must_be_immutable
class HomeDetailPage extends StatelessWidget {
String image;
String desc;

   HomeDetailPage({super.key,required this.image,required this.desc});
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
     
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image),
            Text(desc)
            // Center(child: Text("data"))
          ],
        )
      
    );
  }
}