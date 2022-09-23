import 'package:flutter/material.dart';
import 'package:flutterdemo1/NaviagtionDrawerDemo/AboutPage.dart';
import 'package:flutterdemo1/firstscreen.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage_1(),
  ));
}

class HomePage_1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage_1_State();
}

class _HomePage_1_State extends State{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Naviagtion Drawer Demo"),
       backgroundColor: Colors.brown,
     ),
     drawer: Theme(
       data: Theme.of(context).copyWith(
         canvasColor: Colors.transparent
       ),
       child: Drawer(
         child: ListView(
           children: [
             UserAccountsDrawerHeader(
                 accountName: Text("rahulrekm"),
                 accountEmail: Text("rahulrekm@gmail.com"),
               currentAccountPicture: GestureDetector(
                 child: CircleAvatar(
                   backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgSmojUgwjIB87c4Q0hLCAyl__oiTySWGWJUZtUNHlHjBALLzTsu_vMHYMaEwLts4QEoo&usqp=CAU"),
                 ),
                 onTap: () => Fluttertoast.showToast(msg: "User image"),
               ),
               decoration: BoxDecoration(
                 image: DecorationImage(
                     image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3XNfGDHy1QWxpeu6qzTA2Z9dSXIrrD9cOpQ&usqp=CAU"),
                   fit: BoxFit.cover,
                 )
               ),
             ),
             ListTile(
               title: Text("About Page",style: TextStyle(color: Colors.cyanAccent),),
               trailing: Icon(Icons.info,color: Colors.cyanAccent,),
               onTap: () => Navigator.push(context,
               MaterialPageRoute(builder: (context)=> AboutPage())),
             ),
             ListTile(
               title: Text("Home Page",style: TextStyle(color: Colors.cyanAccent),),
               trailing: Icon(Icons.security,color: Colors.cyanAccent,),
             ),
             ListTile(
               title: Text("Other Page",style: TextStyle(color: Colors.cyanAccent),),
               trailing: Icon(Icons.info,color: Colors.cyanAccent,),
               onTap: () => Navigator.push(context,
                   MaterialPageRoute(builder: (context)=> AboutPage())),
             ),
           ],
         ),
       ),
       
     ),
   );
  }
}