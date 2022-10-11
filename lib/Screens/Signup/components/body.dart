import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicament_project/Screens/Login/login_screen.dart';
import 'package:medicament_project/Screens/Signup/components/background.dart';
import 'package:medicament_project/Screens/Signup/components/or_divider.dart';
import 'package:medicament_project/Screens/Signup/components/social_icon.dart';
import 'package:medicament_project/components/already_have_an_account_acheck.dart';
import 'package:medicament_project/components/rounded_button.dart';
import 'package:medicament_project/components/rounded_input_field.dart';
import 'package:medicament_project/components/rounded_password_field.dart';
import 'package:medicament_project/Models/User.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Body extends StatelessWidget {
  User user = User("", "", "", "", "", "", "");
  String url = "http://127.0.0.1:8000/api/Client";

  Future save(context) async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'prenom': user.prenom,
          'nom': user.nom,
          'adresse': user.adresse,
          'telephone': user.telephone,
          'email': user.email,
          'password': user.password
        }));
    print(res.body);
    var data = json.decode(res.body);
    if (res.body.contains("Client") == true) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginScreen(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGN UP",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.purpleAccent),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/delievery.svg",
              height: MediaQuery.of(context).size.height * 0.40,
            ),
            RoundedInputField(
              hintText: "First name",
              onChanged: (value) {
                user.prenom = value;
              },
            ),
            RoundedInputField(
              hintText: "Last name",
              onChanged: (value) {
                user.nom = value;
              },
            ),
            RoundedInputField(
              hintText: "Addresse",
              onChanged: (value) {
                user.adresse = value;
              },
            ),
            RoundedInputField(
              hintText: "Phone",
              onChanged: (value) {
                user.telephone = value;
              },
            ),
            RoundedInputField(
              hintText: "Your E-mail",
              onChanged: (value) {
                user.email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                user.password = value;
              },
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                save(context);
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocialIcon(
                  iconSrc: "assets/icons/gmail.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
