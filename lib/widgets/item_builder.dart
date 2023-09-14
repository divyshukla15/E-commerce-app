//import 'package:e_coommerce_app/models/cart.dart';
import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/pages/home_details.dart';
import 'package:flutter/material.dart';

import 'add_to_cart.dart';
//import 'package:flutter/scheduler.dart';
//import '../models/catalog.dart';

class ItemWidget extends StatefulWidget {
  final Item items;

  const ItemWidget({super.key, required this.items});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // timeDilation = 5.0;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
                height: 150,
        decoration: const BoxDecoration(
            color: Color.fromARGB(253, 249, 231, 215),
            borderRadius: BorderRadius.all(Radius.circular(13.0))),
        child: Row(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeDetailPage(item: widget.items))),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius : BorderRadius.all(Radius.circular(13.0)),
                  color: Color.fromARGB(220, 220, 241, 229),
                ),
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.height,
                margin: const EdgeInsets.all(10),
                child: Hero(
                  tag: Key(widget.items.desc.toString()),
                  // ignore: sort_child_properties_last
                  child: Image.network(
                    widget.items.image,
                    cacheHeight: 100,
                    cacheWidth: 100,
                  ),
                  transitionOnUserGestures: true,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.items.name),
                Wrap(children: [Text(widget.items.desc,)]),
                SizedBox(
                  width: 200,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\$${widget.items.price}",
                        textScaleFactor: 1.5,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 3, 111, 66),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AddToCart(catalog: widget.items)
                      // Container(
                      //     width: 50,
                      //     height: 50,
                      //     decoration: BoxDecoration(
                      //         color: Color.fromARGB(255, 183, 73, 110),
                      //         borderRadius: BorderRadius.circular(10)),
                      //     child: const Text(
                      //       "Buy",
                      //       textScaleFactor: 1.5,
                      //       style: TextStyle(
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     )),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types


     // decoration: BoxDecoration(color: Colors.grey),
     // child: ListTile(
     //   onTap: () {
       //   print("${item.name} pressed");
      //  },
      //  leading: Image.network(item.image),
      //  title: Text(item.name),
       // subtitle: Text(item.desc),
       // trailing: Text("\$${item.price}",
       //   textScaleFactor: 1.5,
       //   style: const TextStyle(
       //     color: Colors.deepPurple,
        //    fontWeight: FontWeight.bold,
       //   ),
       // ),
     // ),
    //);

