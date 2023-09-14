import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/utils/colors.dart';
import 'package:e_coommerce_app/widgets/drawer.dart';
import 'package:e_coommerce_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
//import 'package:e_coommerce_app/utils/colors.dart';

import '../utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    //final dummyList =List.generate(10, (index)=>CatalogModel.items[0]);
    return RefreshIndicator(
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 1));
            },child:Scaffold(
        backgroundColor: Color.fromARGB(220, 168, 243, 201),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 3, 111, 66),
          elevation: 2.0,
          tooltip: "Add to Cart",
          child: const Icon(
            Icons.shopping_cart_outlined,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, MyRoute.cartRoute);
          },
        ),
        appBar: AppBar(
          title: const Text("Catalog App", style: TextStyle(fontSize: 17)),
        ),
        drawer: const MyDrawer(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const Text(
              //   "Catalog App",
              //   style: TextStyle(fontSize: 28,),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trending Products",
                  style: TextStyle(
                      fontSize: 40, color: dg(), fontWeight: FontWeight.w300),
                ),
              ),
              Expanded(
                child: (CatalogModel.items.isNotEmpty)
                    ? ListView.builder(
                        itemCount: CatalogModel.items.length,
                        itemBuilder: (context, index) => ItemWidget(
                          items: CatalogModel.items[index],
                        ),
                      )
                    :  Center(
                        child: SimpleAnimationProgressBar(
                          height: 15,
                          width: 300,
                          backgroundColor:sc(),
                          foregrondColor:lg(),
                          ratio: 0.5,
                          direction: Axis.horizontal,
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: const Duration(seconds: 3),
                          borderRadius: BorderRadius.circular(10),
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                             BoxShadow(
                              color:dg(),
                              offset:  const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 4.0,
                              spreadRadius: 4.0,
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        )));
  }
}
