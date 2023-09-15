import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/utils/colors.dart';
import 'package:e_coommerce_app/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

//import '../utils/routes.dart';
//import '../models/catalog.dart';

// ignore: must_be_immutable
class HomeDetailPage extends StatelessWidget {
  final Item item;
 
  //String id;
  HomeDetailPage({
    super.key, required this.item,

  });
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text(" Description"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "\$${item.price}",
                textScaleFactor: 1.5,
                style:  TextStyle(
                  color:  dg(),
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddToCart(catalog: item),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Text(item.name),
                    ClipPath(
                  clipper: WaveClipperTwo(),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width,
                    color:Color.fromARGB(220, 220, 241, 229),
                    child: Hero(
                      tag: Key(item.desc.toString()),
                      transitionOnUserGestures: true,
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Center(child: Image.network(item.image),),
                      ),
                    ),),),
                    Text(item.name,
                    style: const TextStyle(fontSize: 20, fontWeight:FontWeight.bold,fontFamily: "Simple"),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(item.desc,style: const TextStyle(fontSize: 17,fontFamily: "Simple"),),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child:  Text("iPhone is a line of smartphones produced by Apple Inc. that use Apple's own iOS mobile operating system. The first-generation iPhone was announced by then-Apple CEO Steve Jobs on January 9, 2007. Since then, Apple has annually released new iPhone models and iOS updates. As of November 1, 2018, more than 2.2 billion iPhones had been sold. As of 2022, the iPhone accounts for 15.6% of global smartphone market shareThe iPhone was the first mobile phone to use multi-touch technology.[4] Since the iPhone's launch, it has gained larger screen sizes, video-recording, waterproofing, and many accessibility features. Up to the iPhone 8 and 8 Plus, iPhones had a single button on the front panel with the Touch ID fingerprint sensor. Since the iPhone X, iPhone models have switched to a nearly bezel-less front screen design with Face ID facial recognition, and app switching activated by gestures. Touch ID is still used for the budget iPhone SE series.",textAlign: TextAlign.justify,style: TextStyle(fontFamily: "Simple"),),
                  ),
              // SizedBox(height: 0.0,),
              // ClipPath(
              //   clipper: WaveClipperTwo(),
              //   child: Container(
              //     height: 220,
              //     color: Colors.orange,
              //     child: Center(child: Text(desc)),
              //   ),
              // ),
              //Text(desc)
              // Center(child: Text("data"))
            ],
          ),
        ));
  }
}
