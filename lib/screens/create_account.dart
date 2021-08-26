import 'package:art_events/widgets/header.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {

  static const routeName = '/create_account';


  @override
  _CreateAccountState createState() => _CreateAccountState();

}


  class _CreateAccountState extends State<CreateAccountScreen> {

    bool isChecked = false;

  @override
  void initState() {
  super.initState();
  }

  @override
  Widget build(context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: <Widget>[
          Text(
            "Créez votre profil",
            style: TextStyle(
              fontFamily: "Raleway-ExtraBold",
              fontSize: 30.0,
              color: Theme.of(context).backgroundColor,
            ),
            textAlign: TextAlign.left,
          ),
            TextFormField(
              decoration: InputDecoration(
                  labelText: 'Pseudo',
                  labelStyle: TextStyle(
                    fontFamily: "Raleway-Regular",
                    fontSize: 10.0,
                    color: Theme.of(context).backgroundColor,
              ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 10.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 10.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
           /* Checkbox(
              checkColor: Colors.white,
              value: isChecked,
              onChanged: (bool? value){
                setState((){
                  isChecked = value!;
                });
              },
            ),*/
      ],
      ),
      ),
    );
  }


}


