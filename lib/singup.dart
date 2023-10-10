import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:topten_app/helper/custom_functions.dart';
// ignore: depend_on_referenced_packages
//import 'package:signup_pro/login.dart';
import 'package:topten_app/login.dart';

// ignore: must_be_immutable, camel_case_types
class signUp extends StatelessWidget {
  //var RaisedButton;
  String? email;
  String? password;
  var formkey = GlobalKey<FormState>();

  // ignore: use_key_in_widget_constructors
  signUp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Sign Up Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
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
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "UserName",
                      prefix: Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.person),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  onChanged: (value) {
                    email = value;
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  onChanged: (value) {
                    password = value;
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
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "failed is required";
                    }
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Confirm Password",
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
                  height: 45,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        try {
                          await CreateAcount(email: email! ,password: password!);

                          // ignore: use_build_context_synchronously
                          NavigateWidget(context , Login(),);

                          // ignore: use_build_context_synchronously
                          Snackbar(context, "Succesfuly");
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            // ignore: use_build_context_synchronously
                            Snackbar(
                                context, "The password provided is too weak.");
                            //print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            // ignore: use_build_context_synchronously
                            Snackbar(context,
                                "The account already exists for that email.");
                            //print('The account already exists for that email.');
                          }
                        } catch (e) {
                          // ignore: avoid_print
                          print(e);
                        }
                      }
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Color.fromARGB(255, 153, 49, 101)),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}