import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PhoneBookDemo(),
  ));
}

class PhoneBookDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PhoneBookDemo_State();
}

class PhoneBookDemo_State extends State<PhoneBookDemo> {
  List<String> namesList = [
    "Rahul",
    "Arjun",
    "Sunil",
    "Rajesh",
    "Biju",
    "Santhosh"
  ];
  List<String> imageList = [
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
    "assets/images/car.png",
  ];
  List<int> phoneNumbersList = [
    9895670679,
    9633451844,
    9995578925,
    9633150698,
    9400420679,
    9946042411,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "My Contacts",
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext, index) {
            return Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.cyanAccent,
              child: ListTile(
                onTap: () {
                  Fluttertoast.showToast(
                      msg: "You can now call or message ${namesList[index]}",
                      toastLength: Toast.LENGTH_LONG);
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(imageList[index]),
                ),
                title: Text(namesList[index]),
                trailing: Wrap(
                  spacing: 10,
                  children: [
                    Text(phoneNumbersList[index].toString()),
                    const Icon(Icons.phone),
                    const Icon(Icons.message)
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext, index) {
            return const Divider(
              thickness: 5,
              color: Colors.white,
            );
          },
          itemCount: imageList.length),
    );
  }
}
