import 'package:flutter/material.dart';
import 'package:flutterdemo1/homepage.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginValidationDemo(),
  ));
}

class LoginValidationDemo extends StatelessWidget{
  final form_state = GlobalKey<FormState>();  // for storing form state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: form_state,  //assigning form state
        child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    validator: (email){
                      if(email==null || !email.contains("@") || !email.contains(".") || email.isEmpty){
                        return "Enter a valid email address";
                      }else
                        return null;
                    },
                    decoration:  InputDecoration(
                      label: Text("Email ID"), border: OutlineInputBorder(),
                       hintText: "Enter a valid email ID",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                      validator: (password){
                        if(password==null || password.length <= 5 || password.isEmpty){
                          return "Enter the password that contains 5 characters";
                        }
                        else{
                          return null;
                        }
                      },
                    decoration: InputDecoration(
                      label: Text("Password"),
                      border: OutlineInputBorder(),
                      hintText: "Password should contain atleast 6 characters"
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: MaterialButton(onPressed: (){
                    final isValid = form_state.currentState!.validate();
                    if(isValid){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                    }else{
                     Fluttertoast.showToast(
                         msg: "Username/password incorrect",
                         toastLength: Toast.LENGTH_SHORT,
                       gravity: ToastGravity.BOTTOM,
                       fontSize: 25,
                     );
                    }
                  },
                    color: Colors.cyanAccent,
                    shape:RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.zero),

                    ),

                    child: Text("Login"),
                  ),
                )
              ],
        ),
      ),
    );
  }
}
