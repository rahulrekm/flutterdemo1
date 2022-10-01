import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExpandedDemo(),
  ));
}

class ExpandedDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" Expanded Widget"),),
      body: Column(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
            ),
          ),
          Expanded(flex: 4,
            child: Container(

              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}