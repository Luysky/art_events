import 'package:art_events/screens/about_screen.dart';
import 'package:art_events/screens/add_event.dart';
import 'package:art_events/screens/create_account.dart';
import 'package:art_events/screens/eventslist_screen.dart';
import 'package:art_events/screens/home_screen.dart';
import 'package:art_events/screens/event_details.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


// Méthode main pour initialiser la firebase + lancer l'app
 Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    App(),
  );
}


 class App extends StatefulWidget {
  _AppState createState() => _AppState();
 }

class _AppState extends State<App> {
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        _initialized = true;
      });
    } catch(e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Show error message if initialization failed
    if(_error) {
      //return SomethingWentWrong();
    }

    // Show a loader until FlutterFire is initialized
    if (!_initialized) {
    }

    return MyArtEvents();
  }
}


class MyArtEvents extends StatelessWidget {

  static const MaterialColor primaryRed = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      50: Color(0xFFCC0022),
      100: Color(0xFFCC0022),
      200: Color(0xFFCC0022),
      300: Color(0xFFCC0022),
      400: Color(0xFFCC0022),
      500: Color(0xFFCC0022),
      600: Color(0xFFCC0022),
      700: Color(0xFFCC0022),
      800: Color(0xFFCC0022),
      900: Color(0xFFCC0022),
    },
  );
  static const int _redPrimaryValue = 0xFFCC0022;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Header',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffFFF1F1),
        backgroundColor: Color(0xFFCC0022),
        scaffoldBackgroundColor: Color(0xffFFF1F1),
        primarySwatch: primaryRed,
        timePickerTheme: TimePickerThemeData(
          backgroundColor: Color(0xffFFF1F1),
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => /* const HomePage(), */ Home(),
        '/eventslist_screen': (ctx) => EventsListScreen(),
        '/extractArguments': (ctx) =>  ExtractArgumentsScreen(),
        '/create_account': (ctx) => CreateAccountScreen(),
        '/add_event' : (ctx) => AddEventScreen(),
        '/about_screen' : (ctx) => AboutScreen(),
      },
    );

  }

}


