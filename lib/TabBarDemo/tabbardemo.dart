import 'package:flutter/material.dart';
import 'package:flutterdemo1/assign_3_first.dart';
import 'package:flutterdemo1/assign_3_login.dart';
import 'package:flutterdemo1/assign_3_register.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TabBarDemo(),
  ));
}

class TabBarDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State{

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab Bar"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.home_filled),
                  text: "home",
                ),
                Tab(
                  icon: Icon(Icons.access_alarm),
                  text: "alarm",
                ),
                Tab(
                  icon: Icon(Icons.account_balance),
                  text: "Account",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
            FirstPage_3(),
              RegisterPage_3(),
              LoginPage_3(),
          ],

          ),
        ),
    );

  }
}