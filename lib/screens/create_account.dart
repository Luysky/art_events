import 'package:art_events/widgets/button_create.dart';
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

  createProfile(BuildContext context) {
    Navigator.of(context).pushNamed('/profile');
  }

  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Form(
        child: ListView(
          padding: EdgeInsets.all(50),
          children: <Widget>[
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
                  onChanged: (bool value) {
                    setState(() {
                      isChecked = value;

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
