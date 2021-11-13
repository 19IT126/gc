import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gc/constants.dart';
import 'package:gc/login_signup/Screens/Login/login_screen.dart';
import 'package:gc/login_signup/Screens/Signup/signup_screen.dart';
import 'package:gc/login_signup/Screens/Welcome/welcome_screen.dart';
import 'package:gc/screens/home/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var user = FirebaseAuth.instance.currentUser;
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
        fontFamily: "Mulish",
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: user == null ? WelcomeScreen() : HomeScreen(),
    );
  }
}
