import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main(){
  runApp(MaterialApp(
home: AlertDemo(),
  ));
}

class AlertDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              MaterialButton(
                    child: Text("Submit"),
                  onPressed: (){
                      showDialog(context: context, builder: (context) => AlertDialog(
                        title: Text(" Do you wish to submit"),
                        backgroundColor: Colors.yellowAccent,
                        actions: [
                          ElevatedButton(
                              onPressed: ()  => SystemNavigator.pop(),
                              child: Text("Exit")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("Back")
                          ),
                        ],
                      ));

                  }),
            ],
          )
        ],
      ),
    );
  }
}