import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(home: Homepage(),));
}

class Homepage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My List View"),
      ),
      body: ListView(
        children: [
          /*Text("Item 1"),
          Text("Item 1"),
          Text("Item 1"),
          Text("Item 1"),
          Text("Item 1"),*/
          Card(color: Colors.black12,
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
          Card( color: Colors.cyan,
            child: ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage("https://imgd-ct.aeplcdn.com/370x208/n/cw/ec/106257/venue-exterior-right-front-three-quarter-2.jpeg?isig=0&q=75"),),
              title: Text("Cars"),
              trailing: Wrap(spacing: 15, children: [
                Icon(Icons.message),
                Icon(Icons.call),
                Icon(Icons.map)
              ],),
              onTap: (){
               // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" sending message")));
                Fluttertoast.showToast(msg: "Hi Cars", toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.BOTTOM);
              },
            ),
          ),
          Card(color: Colors.cyanAccent,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
          Card(color: Colors.brown,shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ListTile(
              leading: Icon(Icons.search),
              title: Text("Search"),
              trailing: Icon(Icons.arrow_circle_right_outlined),
            ),
          ),
        ],
      ),
    );

  }
}