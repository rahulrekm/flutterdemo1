import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomNaviagtionBarDemo(),
  ));
}

class BottomNaviagtionBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _BottomNaviagtionBarState();
}

class _BottomNaviagtionBarState extends State{

  int _selectedIndex = 0;

  List _pages = [
    Icon(Icons.call,size: 150,),
    Icon(Icons.camera,size: 150,),
    Icon(Icons.message,size: 150,),
    Icon(Icons.add,size: 150,),
    Icon(Icons.whatsapp,size: 150,),
  ];

  void _onItemtapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Bottom Naviagtion Bar"),),
        body: Center(
          child: _pages.elementAt(_selectedIndex),
        ),
     bottomNavigationBar: BottomNavigationBar(
       items: <BottomNavigationBarItem>[
         BottomNavigationBarItem(icon: Icon(Icons.call),backgroundColor: Colors.red,label: "Call"),
         BottomNavigationBarItem(icon: Icon(Icons.camera),label: "camera"),
         BottomNavigationBarItem(icon: Icon(Icons.message),label: "Message"),
         BottomNavigationBarItem(icon: Icon(Icons.add),label: "add"),
         BottomNavigationBarItem(icon: Icon(Icons.whatsapp),label: "whatsapp"),
       ],
       currentIndex: _selectedIndex,
       onTap: _onItemtapped,
       backgroundColor: Colors.tealAccent,
     ),
   );

  }
}