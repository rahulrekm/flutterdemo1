import 'package:flutter/material.dart';
import 'package:flutterdemo1/homepage.dart';
import 'package:flutterdemo1/loginpage.dart';
import 'package:flutterdemo1/RegistrationPage.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(primarySwatch: Colors.cyan),
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.redAccent[700], fontSize: 50),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      backgroundColor: Colors.teal[200],
      body: Column(
        children: [
          Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                      decoration: InputDecoration(
                        hintText: "Username",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      showCursor: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: TextField(
                      decoration: InputDecoration(
                        label: Text("Password"),
                        hintText: "Enter your Password",
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                      ),
                      showCursor: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  color: Colors.cyan,
                  height: 50,
                  minWidth: 300,
                  child: const Text("LOG IN"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 250.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                    },
                    child: Text("New User? Register Here"),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

/*
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Center(
          child: Column(
            children:  [
              SizedBox(child: TextField(textAlign: TextAlign.center,),width: 300,height: 150,),
              SizedBox(child: TextField(textAlign: TextAlign.center,),width: 300,height: 150,),
              ElevatedButton(onPressed: (){}, child: null,  ),
            ],
          ),
        ),
      ),
    );
  }
}*/
