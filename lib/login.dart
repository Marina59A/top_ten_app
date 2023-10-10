import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:topten_app/helper/custom_functions.dart';
//import 'package:signup_pro/info.dart';
import 'package:topten_app/info.dart';
import 'package:topten_app/screens/UsersScreen.dart';

class Login extends StatelessWidget {
  Login();
  String? email;
  String? password;
  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Login Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    email=value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Email",
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.email),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                   onChanged: (value) {
                    password=value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: Icon(Icons.lock),
                      ),
                      suffix: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.visibility),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () async {
                      try {
                        await SignIn(email:email!,password:password!);
                         Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => UsersScreen(),
                          ));

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      }
                     
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}
