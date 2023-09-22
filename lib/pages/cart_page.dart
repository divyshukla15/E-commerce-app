import 'package:e_coommerce_app/models/cart.dart';
import 'package:e_coommerce_app/utils/colors.dart';
import 'package:flutter/material.dart';


class CartPage extends StatefulWidget {
  const CartPage({
    super.key,
  });
  
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
   @override
  Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text(" Cart Items"),
        backgroundColor: const Color.fromARGB(220, 168, 243, 201),
      ),
      body: const Column(children: [
        Expanded(child: _CartList()),
        _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatefulWidget {
  const _CartTotal();

  @override
  State<_CartTotal> createState() => _CartTotalState();
}

class _CartTotalState extends State<_CartTotal> {

  @override
  Widget build(BuildContext context) {
final cart = CartModel();
    return Container(
      color: sc(),
      child: SizedBox(
        height: 180,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
           Text(
              "\$${cart.money}",
              style: TextStyle(
                  color: dg(), fontSize: 20, fontWeight: FontWeight.w800),
            ),
       
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: dg(),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17))),
              child: const Text(
                "BUY",
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text("Buying not supported , yet.",
                        style: TextStyle(fontFamily: "Simple"))));
              }),
        ]),
      ),
    );
  }
}

class _CartList extends StatefulWidget {
  const _CartList();

  @override
  State<_CartList> createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(253, 249, 231, 215),
      body: _cart.items.isEmpty
          ? Column(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset("assets/3516854.png"),
                  ),
                ),
                const Text(
                  "No Items in the Cart",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Simple"),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _cart.items.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.done, color: dg()),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline, color: dg()),
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() { });                
                      },
                ),
                title: Text(_cart.items[index].name),
              ),
            ),
    );
  }
}


