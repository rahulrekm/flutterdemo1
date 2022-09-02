import 'package:flutter/material.dart';
import 'package:flutterdemo1/homepage.dart';
import 'package:flutterdemo1/loginpage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: RegistrationPage()));
}

class RegistrationPage extends StatefulWidget {
  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginPage()));
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Registration Page"),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.red, Colors.yellow])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Register Form",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 50,
                    color: Colors.brown,
                    decoration: TextDecoration.underline),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: const Text(
                "Name",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyan,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "Enter Your Name",
                hoverColor: Colors.cyanAccent,
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.contact_phone),
                    label: Text(
                      "Enter Your Mobile Number",
                      textAlign: TextAlign.center,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(1)))),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.cyan,
                  ),
                )),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    label: Text(
                      "Enter Your E-Mail ID",
                      textAlign: TextAlign.center,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)))),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.safety_check),
                    label: Text(
                      "Password",
                      textAlign: TextAlign.center,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                color: Colors.cyan,
                height: 50,
                minWidth: 500,
                child: const Text("Register", style: TextStyle(
                  fontSize: 30, color: Colors.brown
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
