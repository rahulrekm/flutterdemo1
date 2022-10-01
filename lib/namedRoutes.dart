import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: NamedRoutesDemo(),
    routes: {
      "settings" : (BuildContext context) => SettingsPage(),
      "listpage" : (BuildContext context) => ListPage(),
    },
  ));
}


class NamedRoutesDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text(" Named Routes Demo"),),
      body: Center(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
                onPressed: (){
                  Navigator.of(context).pushNamed("settings");
                },
            child: Text("settings"),),
            MaterialButton(
              onPressed: (){
                Navigator.of(context).pushNamed("listpage");
              },
              child: Text("List"),),

          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Settings "),),
    body: Center(child: Text("Settings Page"),),
  );
  }
}

class ListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List "),),
      body: Center(child: Text("List Page"),),

    );
  }
}

