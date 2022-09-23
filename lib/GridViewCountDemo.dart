import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main(){
  runApp(MaterialApp(
    home: GridViewCountDemo(),
  ));
}

class GridViewCountDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          /*children: List.generate(20, (index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/loginloader.gif"),
                fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100))
              ),
            );
          })*/
        children: [
          Container(decoration: BoxDecoration(
            image: DecorationImage(fit: BoxFit.cover,
                image: NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/new-ghost-white-fr-3-4-1-1598911711.jpg?crop=1xw:1xh;center,top&resize=980:*"))
          ),
            margin: EdgeInsets.all(20),
            //child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/new-ghost-white-fr-3-4-1-1598911711.jpg?crop=1xw:1xh;center,top&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20c0535-041-1605715551.jpg?crop=0.719xw:0.596xh;0.236xw,0.389xh&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/19c0564-110-1574284970.jpg?crop=1xw:1xh;center,top&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20171005-02-01-s-1507210109.jpg?crop=1xw:1xh;center,top&resize=980:*")
          ),
          Card( shape: StadiumBorder(),    // three shapes of card are circle , beveled, rectangular
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/screen-shot-2019-06-27-at-10-28-04-am-1561645716.png?crop=0.847xw:0.640xh;0.0714xw,0.252xh&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2020-03-bmw-alpina-xb7-g07-press-042-1589563328.jpg?crop=0.741xw:0.556xh;0.168xw,0.253xh&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2021-cadillac-escalade-046-1580869482.jpg?crop=1xw:1xh;center,top&resize=980:*")
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Image.network("https://hips.hearstapps.com/roa.h-cdn.co/assets/17/15/1491922925-lexuslc500fsport.jpg?crop=1.00xw:0.748xh;0,0.198xh&resize=980:*")
          ),
        ],
      ),
    );
  }
}