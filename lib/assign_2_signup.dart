import 'package:flutter/material.dart';
import 'package:flutterdemo1/assign_2_login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Signup_1(),
  ));
}

class Signup_1 extends StatefulWidget {
  @override
  State<Signup_1> createState() => Signup_1_state();
}

class Signup_1_state extends State<Signup_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(40, 20, 40, 5),
            child: Center(
              child: Text(
                "Sign  Up",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(2.0),
            child: Center(
              child: Text(
                "Create an account it's free",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
              child: Text(
                "Username",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
                padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1))),
                    ),
                    showCursor: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.black))),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
              child: Text(
                "Email",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
                padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1))),
                    ),
                    showCursor: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.black))),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
              child: Text(
                "Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
                padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1))),
                    ),
                    showCursor: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.black))),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
              child: Text(
                "Confirm Password",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
                padding: EdgeInsets.fromLTRB(40, 5, 30, 5),
                child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1))),
                    ),
                    showCursor: true,
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 20, color: Colors.black))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              },
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.blue,
              height: 50,
              minWidth: 300,
              child: const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage_1()));
              },
              child: const Text("Already have an account, Login ")),
        ],
      ),
    );
  }
}
