import 'package:flutter/material.dart';
import 'package:gc/login_signup/Screens/Login/login_screen.dart';
import 'package:gc/login_signup/Screens/Signup/components/background.dart';
import 'package:gc/login_signup/components/already_have_an_account_acheck.dart';
import 'package:gc/login_signup/components/rounded_button.dart';
import 'package:gc/login_signup/components/rounded_input_field.dart';
import 'package:gc/login_signup/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
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
