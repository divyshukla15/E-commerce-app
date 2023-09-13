import 'package:e_coommerce_app/models/catalog.dart';

class CartModel {
  static final cartModel =CartModel._internal();
  CartModel._internal();
  factory CartModel()=> cartModel;
  
  late CatalogModel _catalog;
  final List<int> _itemIds = [];
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();
    num money=0;
   num get totalPrice =>money;
      
      void add(Item item){
        _itemIds.add(item.id);
       money= items.fold(0, (total, current) => total + current.price);
       print(totalPrice);
      print(item.price);
      print(money);
      // print()
       //num lastprice =current.price;
      }
      
      void remove(Item item){
       money= items.fold(money, (total, current) => money - item.price);
      print(totalPrice);
      print(item.price);
      print(money);
      print(item);
        _itemIds.remove(item.id);
      }
}
