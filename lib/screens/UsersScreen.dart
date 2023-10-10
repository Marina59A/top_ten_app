// ignore: file_names
import 'package:flutter/material.dart';
import 'package:topten_app/components/UserItem.dart';
import 'package:topten_app/info.dart';
import 'package:topten_app/models/UserModel.dart';

class UsersScreen extends StatelessWidget {
   UsersScreen({super.key});

List<UserModel1> users=[
    UserModel1(Number:"1", Name: "Mariam Wael", Phone: "0123456789"),
    UserModel1(Number: "2", Name: "Mario Ashraf", Phone: "01023785398"),
    UserModel1(Number: "3", Name: "karol Hany", Phone: "01175559923"),
    UserModel1(Number: "4", Name: "Mera Refaat", Phone: "01089537294"),
    UserModel1(Number: "5", Name: "Omar Khaled ", Phone: "01287349503"),
    UserModel1(Number: "6", Name: "Marina Emad", Phone: "01287430054"),
    UserModel1(Number: "7", Name: "Alaa mohamed", Phone: "01076302278"),
    UserModel1(Number: "8", Name: "Kyrillos Ayman", Phone: "0113908473"),
    UserModel1(Number: "9", Name: "Islam Hassan", Phone: "01087239902"),
    UserModel1(Number: "10", Name: "Mariam Bassem", Phone: "012438294400"),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text("Top Ten",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("images/top-10.png"),
            )
          ],
        ),
        body:  ListView.separated(itemBuilder: (context ,index){
          var currentUser=users[index];
          return GestureDetector(
            onTap: ()=> Navigator.push(context, 
            MaterialPageRoute(builder: (context)=> MyInfo(name: currentUser.Name, phone: currentUser.Phone),),),
            child: UserItem(userModel1: users[index]),
          );
        },
         separatorBuilder: (context , index)=> const Divider(
          indent: 20,
          endIndent: 20,
         ),
          itemCount: users.length,)
          )
      ;//=>UserItem(userModel1: users[index]),
  }
}