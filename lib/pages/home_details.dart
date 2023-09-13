import 'package:e_coommerce_app/models/catalog.dart';
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
          title: const Text(" description"),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "\$${item.price}",
                textScaleFactor: 1.5,
                style: const TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AddToCart(catalog: item),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
                clipper: WaveClipperTwo(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.orange,
                  child: Hero(
                    tag: Key(item.desc.toString()),
                    transitionOnUserGestures: true,
                    child: Center(child: Image.network(item.image)),
                  ),
                )),
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
        ));
  }
}
