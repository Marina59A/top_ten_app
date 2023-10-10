import 'package:flutter/material.dart';
import 'package:topten_app/singup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, 
      MaterialPageRoute(builder: (context)=>signUp()));

    });
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 150,
          height: 150,
          child: Image.asset("images/top-10.png"),
      
          
        ),
      )
    );
  }
}

