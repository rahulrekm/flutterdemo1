import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(

   home: MediaqueryDemo(),
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      visualDensity: VisualDensity.adaptivePlatformDensity
    ),
  ));
}

class MediaqueryDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MeadiaqueryDemoState();
}

class _MeadiaqueryDemoState extends State{
  late MediaQueryData mdata;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    mdata = MediaQuery.of(context);
   return Scaffold(
     appBar: AppBar(title: Text("Media Query Demo"),),
     body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Text("Device Info",style: TextStyle(fontSize: 25),)),
          _text("Height  ${mdata.size.height}"),
          _text("Width   ${mdata.size.width}"),
        ],
     ),

   );
  }
  Widget _text(String text) => Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(text,style: TextStyle(
      fontSize: 20,
      color: Colors.red,
    ),),
  );
}

