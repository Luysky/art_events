import 'package:art_events/models/modelUser.dart';
import 'package:art_events/service/authentificationService.dart';
import 'package:art_events/widgets/button_create.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

final firebase_storage.Reference storageRef = firebase_storage.FirebaseStorage.instance.ref();
final usersRef = FirebaseFirestore.instance.collection('user');
final eventsRef = FirebaseFirestore.instance.collection('event');

/*
* Classe pour l'écran de la homepage
* Lié directement avec la firebase Authentification
* Possibilité de s'inscrire ou de se loguer
*/
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final AuthentificationService _auth = AuthentificationService();
  TextEditingController emailController = new TextEditingController(text: "bretzlouise@gmail.com"); // texte ajouté pour facilité le travail 
  TextEditingController passwordController = new TextEditingController(text: "123456");
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = !_obscureText;
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        alignment: Alignment.center,
      ),
    );
  }


  createAccountScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/create_account');
  }

  EventsListScreen(BuildContext context) {
    Navigator.of(context).pushNamed('/eventslist_screen');
  }

 @override
  Widget build(BuildContext context) {
    print("Lancement HOMESCREEN");
    //final mediaQuery = MediaQuery.of(context);
    //var widthFav, heightFav;
    //widthFav = mediaQuery.size.width;
    //heightFav = mediaQuery.size.height;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(50),
          children: <Widget>[
            Image.asset(
              'assets/images/logo_avoir_vf.png',
              width: 150,
              height: 200,
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'Bienvenue !',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontFamily: "Raleway-ExtraBold",
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Entrez votre login',
              style: TextStyle(
                fontFamily: "Raleway-Regular",
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
                color: Theme.of(context).backgroundColor,
              ),
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
              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrez votre adresse mail correct';
                              }
                              return null;
                            }),
            SizedBox(
              height: 20,
            ),
    
            TextFormField(
              controller: passwordController,
              obscureText: true,
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
              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Entrez votre mot de passe correct';
                              }
                              return null;
                            }),
           
           
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).backgroundColor,
                textStyle: TextStyle(fontFamily: "Raleway-Regular",
                  fontSize: 14.0)
              ),
                            onPressed: () async {
                              print('Before');
                              print(_formKey.currentState);
                              if (_formKey.currentState!.validate()) {
                                    print("ici");
                                    Object? result = await _auth.signIn(
                                    email: emailController.text,
                                    password: passwordController.text);
                                    
                                if (result is ModelUser) {
                                  print("Authentification OK = " + result.id);
                                  EventsListScreen(context);
                                } else {
                                  print(result.toString());
                                }
                              }
                            },
                            child: Text('Se connecter')),
            SizedBox(
              height: 10,
            ),
            CustomButton(
              () => createAccountScreen(context),
              "S'inscrire",
            ),
          ],
        ),
      ),
    );
  }
}
