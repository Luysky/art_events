import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading /*, this.popUpMenuItem */);
  final String heading;
//  final List<Widget> popUpMenuItem;

  @override
  Widget build(BuildContext context) => AppBar(

    title: Align(alignment: Alignment.centerLeft,
      child: Text(
      // isAppTitle ? heading : 'ErrorAppBar',
      heading,
      style: TextStyle(
        color: Theme.of(context).primaryColor,
        fontFamily: "Raleway-ExtraBold",
        fontSize: 30.0,
      ),
    ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).backgroundColor,

    //Displaying AppBar Button(s)
/*    actions: BuildContext(
        popUpMenuItem

    );
      //popUpMenuItem,
    */
      );  
}
/*
class PopUpAppBarButton extends StatelessWidget {
 const PopUpAppBarButton(this.popUpAppBarButton);
  final List<Widget> popUpAppBarButton;

@override
  List<Widget> build(BuildContext context) => Widget[
    
        popUpAppBarButton,
        
  ]   
      
      );


}
*/
class Paragraph extends StatelessWidget {
  const Paragraph(this.content);
  final String content;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          content,
          style: const TextStyle(fontSize: 18),
        ),
      );
}

class IconAndDetail extends StatelessWidget {
  const IconAndDetail(this.icon, this.detail);
  final IconData icon;
  final String detail;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8),
            Text(
              detail,
              style: const TextStyle(fontSize: 18),
            )
          ],
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed});
  final Widget child;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) => OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.deepPurple)),
        onPressed: onPressed,
        child: child,
      );
}
