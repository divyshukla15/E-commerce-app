import 'package:e_coommerce_app/models/cart.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Cart")),
      body: 
      
       const Column(children: [
          Expanded(child: _CartList()),
          // Divider(),
            _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({super.key});

  @override
  Widget build(BuildContext context) {
     final _cart= CartModel();
    return  SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Text("\$${_cart.totalPrice}"),
        ElevatedButton(
          child: Text("buy"),
          onPressed:(){
            ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(backgroundColor: Colors.red,content: Text("Buying not supported")
            ));
           } 
          ),
           
      ]),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList({super.key});

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart= CartModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: const Icon(Icons.done),
        trailing: IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        // ignore: prefer_const_constructors
        title: Text(_cart.items[index].name),
      ),
    );
  }
}
