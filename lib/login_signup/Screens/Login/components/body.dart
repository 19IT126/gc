import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gc/login_signup/Screens/Login/components/background.dart';
import 'package:gc/login_signup/components/already_have_an_account_acheck.dart';
import 'package:gc/login_signup/components/rounded_button.dart';
import 'package:gc/login_signup/components/rounded_input_field.dart';
import 'package:gc/login_signup/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  String username, password;
  Future<void> signIn(BuildContext context) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);
      Navigator.popAndPushNamed(context, '/homeScreen');
    } catch (e) {
      print(e);
    } finally {
      checkAuth();
    }
  }

  Future<void> checkAuth() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        print("Signed In!!");
      } else {
        print("Signed Out!!");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "LOGIN",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/login.png",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                username = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                signIn(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.popAndPushNamed(context, '/signUpScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
