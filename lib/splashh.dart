import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterdemo1/loginpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),));
}

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 7), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.amberAccent,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "assets/images/carshowroom.jpg"))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const [
                Image(image: AssetImage("assets/images/car.png"),
                  height: 100,
                  width: 100,
                ),
                Image(
                 image: AssetImage("assets/images/cargif.gif"),
                 width: 150,
                  height: 150,
                  repeat: ImageRepeat.repeatX,
                ),
                Text(
                  "Loading Splash",
                  style: TextStyle(fontSize: 30, color: Colors.cyan),
                )
              ],
            ),
          ),
        ),
      );
  }
}
