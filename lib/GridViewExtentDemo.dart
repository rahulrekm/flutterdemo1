import 'package:flutter/material.dart';

void main(){
  
  runApp(MaterialApp(
    home: GridViewExtentdemo(),
    debugShowCheckedModeBanner: false,
  ));
}

class GridViewExtentdemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.extent(
          maxCrossAxisExtent: 200,
        children: List.generate(20, (index) {
          return Card(
            child: Image.asset("assets/images/cargif.gif"),
          );
        }),
      ),
    );
    
      }
}