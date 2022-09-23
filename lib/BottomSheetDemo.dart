import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: BottomSheetDemo(),
    theme: ThemeData(canvasColor: Colors.cyanAccent),
  ));
}

class BottomSheetDemo extends StatelessWidget {
  void showBottomSheet_demo(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.teal,
      isScrollControlled: true,
      elevation: 5,
      context: context,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 15,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text("Name"),
              ),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text("Mobile Number"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Submit")),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BottomSheet Demo"),),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showBottomSheet_demo(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
