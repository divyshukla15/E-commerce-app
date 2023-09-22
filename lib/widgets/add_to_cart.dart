import 'package:e_coommerce_app/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/cart.dart';

import '../utils/colors.dart';

class AddToCart extends StatefulWidget {
  final Item? catalog;

  const AddToCart({
    super.key,
    this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

// ignore: camel_case_types
class _AddToCartState extends State<AddToCart> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: dg(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17)
        )
      ),
      onPressed: () {
        if (!isInCart) {
          // ignore: no_leading_underscores_for_local_identifiers
          final _catalog = CatalogModel();
          isInCart = true;
          // ignore: no_leading_underscores_for_local_identifiers

          _cart.catalog = _catalog;
          _cart.add(widget.catalog!);
          setState(() {});
        }
      },
      // ignore: prefer_const_constructors
      child: isInCart ? Icon(Icons.done, ) : Icon(CupertinoIcons.cart_badge_plus,
    ));
  }
}
