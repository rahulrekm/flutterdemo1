import 'package:flutter/material.dart';
import 'package:flutterdemo1/value_passing_btwn_screens/ProductListScreen.dart';
import 'package:flutterdemo1/value_passing_btwn_screens/SingleProductScreen.dart';

void main(){
  runApp(Home());
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductListScreen(),
      routes: {
        "single-product" : (context) => SingleProductScreen(),
      },

    );
  }
}