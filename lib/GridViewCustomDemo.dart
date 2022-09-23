import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: GridViewCustomDemo(),
  ));
}

class GridViewCustomDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.custom( padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          childrenDelegate: SliverChildBuilderDelegate((BuildContext, index){
           return Image.asset("assets/images/cargif.gif",fit: BoxFit.cover,);
          }, childCount: 40
      ),
      ),
    );
  }
}