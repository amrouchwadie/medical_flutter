import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicament_project/Screens/Login/login_screen.dart';
import 'package:medicament_project/Screens/Signup/signup_screen.dart';

import 'package:medicament_project/Screens/Welcome/components/background.dart';
import 'package:medicament_project/components/rounded_button.dart';
import 'package:medicament_project/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome To Pharmacy",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kPrimaryColor),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SvgPicture.asset("assets/icons/Vaccine.svg",
                height: MediaQuery.of(context).size.width * 0.99),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginScreen();
                  }),
                );
              },
            ),
            RoundedButton(
              text: "Registration",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
