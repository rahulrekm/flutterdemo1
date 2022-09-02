import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(First());

}

class First extends StatelessWidget {
  String name = "RAHUL R";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("My App", textAlign: TextAlign.center),
          backgroundColor: Colors.lightGreenAccent,
          titleTextStyle: const TextStyle(fontSize: 30, color: Colors.indigo),
        ),
        body:  Center(
            child: Text(
          "Hi $name \n Welcome to flutter  \n",
          textAlign: TextAlign.center,
          style: TextStyle(
              backgroundColor: Colors.white, fontSize: 50, color: Colors.brown),
        )),
      ),
    );
  }
}
