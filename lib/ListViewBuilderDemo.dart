import 'package:flutter/material.dart';
import 'package:flutterdemo1/ListViewBuilderDemo.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(
    home: ListBuilderDemo(),
  ));
}

class ListBuilderDemo extends StatefulWidget{
  @override
  State<ListBuilderDemo> createState() => ListViewBuilderDemo_State();
  }

class ListViewBuilderDemo_State extends State<ListBuilderDemo>{
  List<String> cars = ["benz","toyota","ford"];
  List<String> images = ["https://imgd.aeplcdn.com/664x374/n/cw/ec/47336/e-class-exterior-right-front-three-quarter.jpeg?q=75",
                          "https://stimg.cardekho.com/images/carexteriorimages/930x620/Toyota/Land-Cruiser/8448/1623313668941/front-left-side-47.jpg",
                          "https://imgd.aeplcdn.com/0x0/n/cw/ec/45691/marutisuzuki-dzire-right-front-three-quarter8.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ListView Builder "),),
      /*body: ListView.builder(itemBuilder: (BuildContext, index){
        return Card(
          child: ListTile(
            leading: Image.network(images[index]),
            title: Text(cars[index]),
          ),
        );
      },itemCount: images.length, ),
*/
      body: ListView.separated(itemBuilder: (BuildContext, index){
        return Card(
          child: ListTile( onTap: (){Fluttertoast.showToast(msg: "You can select now ${cars.elementAt(index)}");},
            leading: CircleAvatar(child: Image.network(images[index]),),
            title: Text(cars[index]),
          ),
        );
      },
          separatorBuilder: (BuildContext, index){
          return Divider(thickness: 3,color: Colors.cyan,height: 2, );
          },
          itemCount: images.length),
    );
  }
}
