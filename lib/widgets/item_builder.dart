import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/pages/home_details.dart';
import 'package:flutter/material.dart';
import 'add_to_cart.dart';


class ItemWidget extends StatefulWidget {
  final Item items;

  const ItemWidget({super.key, required this.items});

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  void initState() {
    
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    
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
                          HomeDetailPage(item: widget.items)),).then((value)=> setState(() {
              
            })),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(13.0)),
                  color: Color.fromARGB(220, 220, 241, 229),
                ),
                width: MediaQuery.of(context).size.width * 0.3,
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
            Flexible(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.items.name,
                          style: const TextStyle(
                              fontFamily: "Simple",
                              fontWeight: FontWeight.w600,
                              fontSize: 15)),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0, right:8.0,bottom: 10.0),
                        child: Text(
                          widget.items.desc,
                          style: const TextStyle(fontFamily: "Simple"),
                        ),
                      ),
                      SizedBox(
                        width: 200,
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
                               ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


