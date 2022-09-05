import 'package:flutter/material.dart';
import 'package:flutterdemo1/assign_2_signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage_1(),
  ));
}

class LoginPage_1 extends StatefulWidget {
  @override
  State<LoginPage_1> createState() => LoginPage_1_state();
}

class LoginPage_1_state extends State<LoginPage_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 30, 0),
            child: Center(
              child: Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Login to your account",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
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
                padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
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
              padding: EdgeInsets.fromLTRB(20, 10, 30, 10),
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
                padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signup_1()));
              }, child: Text("Don't have an account, Sign up?")),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage("assets/images/door.jpg"),
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
