import 'package:flutter/material.dart';
import 'package:flutterdemo1/value_passing_btwn_screens/dummy_data.dart';

class SingleProductScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    final productId = ModalRoute.of(context)?.settings.arguments;

    final products = dummyProducts.firstWhere((element) => element["id"] == productId);

    return Scaffold(
        appBar: AppBar(title: Text(products["name"]),),
     body: Padding(
       padding: const EdgeInsets.all(20.0),
       child: Column(
         children: [
           Text(           // product name
               "Name:  ${products["name"]}",
             style: TextStyle(fontSize: 25,color: Colors.cyan),
           ),
           Text(  // product price
             "Price : ${products["price"]} ",
             style: TextStyle(fontSize: 20,color: Colors.redAccent),
           ),
           Text(
               " Decsription : ${products["description"]}"
           ),
           Image(image: AssetImage(products["image"])),
         ],
       ),
     ),
   );
  }

}