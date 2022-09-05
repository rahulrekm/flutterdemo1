import 'package:flutter/material.dart';
import 'package:flutterdemo1/assign_2_login.dart';
import 'package:flutterdemo1/assign_2_signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstPage_1(),
  ));
}

class FirstPage_1 extends StatefulWidget {
  @override
  State<FirstPage_1> createState() => FirstPage_1_state();
}

class FirstPage_1_state extends State<FirstPage_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(50, 50, 50, 10),
            child: Center(
                child: Text(
              "Welcome to the app",
              style: TextStyle(fontSize: 30),
            )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(image: AssetImage("assets/images/welcome.jpg")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage_1()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(20))),
              color: Colors.blue,
              height: 50,
              minWidth: 300,
              child: const Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signup_1()));
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              color: Colors.blue,
              height: 50,
              minWidth: 300,
              child: Text(
                "Sign up",
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
