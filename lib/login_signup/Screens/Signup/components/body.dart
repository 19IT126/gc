import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gc/login_signup/Screens/Login/login_screen.dart';
import 'package:gc/login_signup/Screens/Signup/components/background.dart';
import 'package:gc/login_signup/components/already_have_an_account_acheck.dart';
import 'package:gc/login_signup/components/rounded_button.dart';
import 'package:gc/login_signup/components/rounded_input_field.dart';
import 'package:gc/login_signup/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  String username, password;
  Future<void> signUp(BuildContext context) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: username, password: password);
      Navigator.popAndPushNamed(context, '/loginScreen');
      showToast("Successful Signed-Up!!");
    } catch (e) {
      showToast(e.message);
      print(e);
    }
  }

  void showToast(String msg) => Fluttertoast.showToast(
        msg: msg,
        fontSize: 16,
        backgroundColor: Color(0xBF2B9A00),
        textColor: Colors.white,
      );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   "SIGNUP",
            //   style: TextStyle(fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: size.height * 0.03),
            Image.asset(
              "assets/icons/signup.png",
              height: size.height * 0.35,
            ),
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
              text: "SIGNUP",
              press: () {
                signUp(context);
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.popAndPushNamed(context, '/loginScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
