import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {

  static const routeName = '/profile';


  @override
  _ProfilState createState() => _ProfilState();

}


class _ProfilState extends State<ProfilScreen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Text('This will be profil page');
  }
}