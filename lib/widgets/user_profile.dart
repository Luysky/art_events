import 'package:art_events/models/modelUser.dart';
import 'package:flutter/material.dart';

class UserProf extends StatelessWidget {
 //final String id;
//  final String username;

  final ModelUser user;

  UserProf(this.user);
//  UserProf(this.username);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.all(15),
            child: Row(
              children: [
                Icon(
                    Icons.account_circle,
                color: Colors.white,
                size: 35,),
          /*      const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(
                    'assets/images/Pseudo.png',
                  ),
                ), */
                SizedBox(width: 10,),
                Text(
                  user.username,
                  style: TextStyle(
                    fontFamily: "Raleway-Regular",
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),

              ],
            ),
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
