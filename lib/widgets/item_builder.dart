import 'package:e_coommerce_app/models/catalog.dart';
import 'package:e_coommerce_app/pages/home_details.dart';
import 'package:flutter/material.dart';


class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 236, 148, 177)),
        child: Row(
        
          children: [
            InkWell( onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(image: item.image,desc: item.desc,))),
              child: Container(
                
                color: Colors.grey,
                width: 100,
                height: 100,
                margin: const EdgeInsets.all(10),
               
                child:Image.network(item.image,cacheHeight: 80,cacheWidth: 80,),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name),
                Text(item.desc),
                Container(
                width: 260,
                color: Colors.amber,
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
                      ElevatedButton(onPressed: (){}, child: const Text("Buy"))
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

