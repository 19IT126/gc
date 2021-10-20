import 'package:flutter/material.dart';
import 'package:gc/constants.dart';
import 'package:gc/login_signup/Screens/Login/login_screen.dart';
import 'package:gc/login_signup/Screens/Signup/signup_screen.dart';
import 'package:gc/login_signup/Screens/Welcome/welcome_screen.dart';
import 'package:gc/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/signUpScreen": (BuildContext) => SignUpScreen(),
        "/loginScreen": (BuildContext) => LoginScreen(),
        "/homeScreen": (BuildContext) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Plant App',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }
}
