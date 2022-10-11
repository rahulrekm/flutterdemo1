
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingDemo(),
    );
  }

}

class OnboardingDemo extends StatefulWidget{
OnboardingDemo({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => OnboardingDemoState();

}

class OnboardingDemoState extends State{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingAnimation(
        controller: PageController(initialPage: 0),
        pages: [
          _Pages(image: "assets/images/car.png",
              pageContent: CircleAvatar(radius: 5,
            backgroundImage: AssetImage("assets/images/cargif.gif"),
          )),
          _Pages(image: "assets/images/car.png",
              pageContent: CircleAvatar(radius: 5,
                backgroundImage: AssetImage("assets/images/door.jpg"),
              )),
          _Pages(image: "assets/images/carshowroom.jpg",
              pageContent: CircleAvatar(
                backgroundImage: AssetImage("assets/images/cargif.gif"),
              )),
        ],
        indicatorType: IndicatorType.colourTransitionDots,
        indicatorDotHeight: 10,
        indicatorDotSpacing: 5,
        indicatorDotWidth: 10,
        indicatorPosition: IndicatorPosition.bottomCenter,
      ),
    );
  }
}

class _Pages extends StatelessWidget{

  late final String image;
  final CircleAvatar pageContent;

  _Pages(
      {
    Key? key,
        this.image = '',
        required this.pageContent,
}
      ):super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(height: 700,width: 460,
          color: Colors.cyan,
          child: DecoratedBox(
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)),
              ),
            child: pageContent),
        ),
      ],
    );
  }

}


