import 'package:flutter/material.dart';
import 'package:flutterdemo1/value_passing_btwn_screens/dummy_data.dart';

class ProductListScreen extends StatelessWidget{

  void _gotoSingle(context, productId){
    Navigator.of(context).pushNamed("single-product", arguments: productId);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List"),),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: dummyProducts.map((singleProduct) {
            return  ListTile(
              onTap: () => _gotoSingle(context, singleProduct["id"]),
              title: Text(singleProduct["name"]),
            );
          }).toList(),
        ),
    );
  }

}