import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/widgets/drawer.dart';
import 'package:e_coommerce_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
    final catalogJson =
        await rootBundle.loadString("assets/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    //final dummyList =List.generate(10, (index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: const Text(" Home Page")),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text("Catalog App",style: TextStyle(fontSize: 28),),
        Text("Trending App",style: TextStyle(fontSize: 20),),
       Expanded(child:(CatalogModel.items.isNotEmpty)
        ? ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) => ItemWidget(
              item: CatalogModel.items[index],
            ),
          )
        : const Center(
            child: CircularProgressIndicator(),
          ) ,),

        
      
      ],)
    );
  }
}
