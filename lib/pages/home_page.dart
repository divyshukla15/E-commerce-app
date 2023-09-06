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
  void initState(){
    super.initState();
    loadData();
  }
  loadData()async{
    await Future.delayed(Duration(seconds:2));
   final catalogJson =await rootBundle.loadString("assets/files/catalog.json");
   final decodeData =jsonDecode(catalogJson);
   var productsData = decodeData('products');
    CatalogModel.items=List.from(productsData).
    map<Item>((item)=> Item.fromMap(item)).toList();
    setState(() {
      
    });
   //print(catalogJson);
  }
  Widget build(BuildContext context) {
    //final dummyList =List.generate(10, (index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(title: Text(" Home Page")),
      drawer: MyDrawer(),
      
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: (CatalogModel.items.isNotEmpty)?
        ListView.builder(
            itemCount: CatalogModel.items.length,
            itemBuilder: (context, index) {
             return ItemWidget(
              item:CatalogModel.items.);
            }):Center(child:CircularProgressIndicator())
      ),
    );
  }
}
