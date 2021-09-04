import 'dart:io';
import 'package:art_events/widgets/progress.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:art_events/models/user.dart';
import 'package:art_events/widgets/button_create.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:art_events/screens/home_screen.dart';

class CreateAccountScreen extends StatefulWidget {
  static const routeName = '/create_account';
 // final User currentUser;
//  User testUser = const User(id: "01", username: "testUser", email: "email", password: "123", isSubscribed: false, isServiceProvider: false);

  CreateAccountScreen(/*{this.currentUser = const testUser}*/);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccountScreen> {
  bool isChecked = false;
  bool isUploading = false;
  TextEditingController pseudoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userId = Uuid().v4();

  @override
  void initState() {
    super.initState();
  }

  createProfile(BuildContext context) async {
    await handleSubmit();
    Navigator.of(context).pushNamed('/profile');
  }

  createUserInFirestore({required String pseudo, required String email, required String password}){

    usersRef
        .add({
   //   "id" : userId,
      "username": pseudo,
      "email" : email,
      "password" : password,
      "isServiceProvider" : false,
      "isSubscribed" : false,
    });
  }

  handleSubmit() {
    setState((){
      isUploading = true;
    });

    createUserInFirestore(
      pseudo: pseudoController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    pseudoController.clear();
    emailController.clear();
    passwordController.clear();
    setState((){
      isUploading = false;
      userId = Uuid().v4();
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: <Widget>[
            isUploading ? linearProgress() : Text(""),
            Text(
              "Créez votre profil",
              style: TextStyle(
                fontFamily: "Raleway-Regular",
                fontSize: 30.0,
                color: Theme.of(context).backgroundColor,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: pseudoController,
              decoration: InputDecoration(
                labelText: 'Pseudo',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Adresse mail',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
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
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Mot de passe',
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Exposant',
                  style: TextStyle(
                    fontFamily: "Raleway-Regular",
                    fontSize: 15.0,
                    color: Theme.of(context).backgroundColor,
                  ),
                ),
                Checkbox(
                  fillColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).backgroundColor),
                  focusColor: Theme.of(context).backgroundColor,
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool ?value) {
                    setState(() {
                      isChecked == value;

                    });
                  },
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              () => createProfile(context),
              'CRÉER',
            ),
            SizedBox(
              height: 20,
            ),
            Image.asset(
              'assets/images/logo_avoir_vf.png',
              width: 100,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
