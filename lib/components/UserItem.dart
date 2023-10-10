import 'package:flutter/material.dart';
import 'package:topten_app/models/UserModel.dart';

class UserItem extends StatelessWidget {
  UserModel1 userModel1;
   UserItem({required this.userModel1});

  @override
  Widget build(BuildContext context) {
    return 
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.blue,
                    child: Text(userModel1.Number!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModel1.Name!,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),),
                    Text(userModel1.Phone!,
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 17,
                    ),)
                  ],
                )
              ],
            );
  }
}