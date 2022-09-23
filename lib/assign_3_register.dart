import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: RegisterPage_3(),
  ));
}

class RegisterPage_3 extends StatefulWidget {
  @override
  State<RegisterPage_3> createState() => RegisterPage_3_State();
}

class RegisterPage_3_State extends State<RegisterPage_3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SingleChildScrollView(
        child: Container(
          width: 500,
          height: 900,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 450, 10),
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: const BoxDecoration(
                          color: Colors.cyan,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: const Text(
                        "X",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 30, 40, 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                          color: Colors.cyan,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.cyan)),
                      child: const Text(
                        "REGISTER",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.cyan,
                          ),
                          hintText: "DISPLAY NAME",
                          hintStyle: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 2),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.cyan),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                          hintText: "EMAIL",
                          hintStyle: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 2),
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: Colors.cyan),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.cyan,
                          ),
                          hintText: "PASSWORD",
                          hintStyle: TextStyle(
                              color: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              letterSpacing: 2),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.cyan,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 40, 4, 5),
                    child: MaterialButton(
                      onPressed: () {
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      color: Colors.cyan,
                      height: 60,
                      minWidth: 490,
                      child: const Text(
                        "CREATE ACCOUNT",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
