import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AboutPage(),
  ));
}

class AboutPage extends StatelessWidget{
  List<String> friuts_images = [
    "assets/images/avocado.jpeg",
    "assets/images/cashew.jpg",
    // "assets/images/CustardApple.jpeg",
    "assets/images/dragonfriut.jpg",
    "assets/images/durian.jpg",
    "assets/images/fig.jpg",
    "assets/images/FreshDates.jpg",
    "assets/images/jackfruit.webp",
    "assets/images/kiwi.jpg",
    "assets/images/litchi.jpg",
    "assets/images/mulberry.jpg",
    "assets/images/rambutan.jpg",
    "assets/images/starfruit.jpg",
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        title: Text("About Page"),

      ),
     body: Column(
   mainAxisSize: MainAxisSize.min,
       children: <Widget>[
       Text(
       'Exotic Fruits',
       style: TextStyle(fontSize: 30),
    ),
    Expanded(
    child: ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: friuts_images.length,
    itemBuilder: (BuildContext context, int index) => Card(
    child: Image.asset(friuts_images[index],fit: BoxFit.cover,),
    ),
    ),
    ),
    Text(
    'Exotic Fruits',
    style: TextStyle(fontSize: 30),
    ),
    Expanded(
    child: ListView.builder(
    shrinkWrap: true,
    itemBuilder: (ctx,int){
    return Card(
    child: Image.asset(friuts_images[int],fit: BoxFit.cover,)
    );
    },
    ),
    ),
    ],
    ),
   );
  }
}