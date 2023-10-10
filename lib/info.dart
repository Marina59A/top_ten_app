import 'package:flutter/material.dart';
import 'package:topten_app/screens/UsersScreen.dart';

class MyInfo extends StatelessWidget {
  String name;
  String phone;
  MyInfo({required this.name, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        backgroundColor: Colors.purple,
         title: MaterialButton(onPressed: 
         (){
           Navigator.push(context, 
           MaterialPageRoute(builder: 
           (context)=> UsersScreen(),));
         } , ),
        
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           const CircleAvatar(
            radius: 75,
            backgroundColor: Colors.white,
             child: Icon(Icons.person,
             size: 50,),
           ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text(name,
            style: const TextStyle(
              color: Color.fromARGB(255, 44, 2, 39),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "DancingScript"
            ),),
          ),
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text("Software Engineer",
            style: TextStyle(
              color: Color.fromARGB(255, 44, 2, 39),
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.white,
            width: 100,
            height: 50,
            margin: const EdgeInsets.all(10),
                child:ListTile(
                  leading: const Icon(Icons.phone),
                  title: Text(phone ,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 94, 15, 90),
                    fontWeight: FontWeight.bold
                  ),),
                )    
            ),
          
           Container(
            color: Colors.white,
            width: 100,
            height: 50,
            margin: const EdgeInsets.all(10),
            child: 
                ListTile(
                  leading: const Icon(Icons.link),
                  title: Text("http//:linkedin/$name.com" ,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 94, 15, 90),
                    fontWeight: FontWeight.bold
                  ),),
                ),
            ),
           
           Container(
            color: Colors.white,
            width: 100,
            height: 50,
            margin: const EdgeInsets.all(10),
            child: 
                const ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text("Atomika , Sohag" ,
                  style: TextStyle(
                    fontSize: 17,
                    color: Color.fromARGB(255, 94, 15, 90),
                    fontWeight: FontWeight.bold
                  ),),
                ),
            ),
          
          
        ],
      ),
    );
  }
}