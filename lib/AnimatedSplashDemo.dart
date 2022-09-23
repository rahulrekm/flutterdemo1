import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(
    home: AnimatedSplash(),
    debugShowCheckedModeBanner: false,
  ));
}

class AnimatedSplash extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: ListView(
      children: [
        Lottie.network("https://assets7.lottiefiles.com/packages/lf20_l3cnkxvf.json"),
       Lottie.asset("assets/83168-login-success.json"),
      Image.asset("assets/images/cargif.gif"),


      ],
     ),
   );
  }
}