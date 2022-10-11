import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MultiSelectDemo(),
  ));
}

class MultiSelectDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MultiSelectDemoState();
}

class _MultiSelectDemoState extends State{
  TextEditingController textEditingController = TextEditingController();
  List newList = [];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Multi Select Demo"),),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(controller: textEditingController,
                            onChanged: (String value){
                              setState(() {

                              });
                            },
                            decoration: InputDecoration(
                              label: Text("Search"),
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                              suffixIcon: Icon(Icons.search),
                            ),
                  ),
                  ListView.builder(itemCount: 15,shrinkWrap: true,
                      itemBuilder: (BuildContext, index){
                        return Card(elevation: 8,
                          child: ListTile(
                            tileColor: Colors.green,
                            textColor: Colors.cyan,
                            title: Text("item $index"),
                          ),
                        );
                      }
                  ),
                ],
              ),
            ),
          ),
   );
  }
}