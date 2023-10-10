
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void NavigateWidget(BuildContext context ,Widget widget) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }

  void Snackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> CreateAcount({required String email,required String password}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

Future<void> SignIn({required String email,required String password}) async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
         password: password);
  }