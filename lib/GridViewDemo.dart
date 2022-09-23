import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: GridViewDemo(),
  ));
}

class GridViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
    children: List.generate(30, (index) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/loginloader.gif")),
          ),
        );
      }),
    ),
    );
  }
}