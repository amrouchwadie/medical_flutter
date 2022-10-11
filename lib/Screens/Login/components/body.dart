import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';
import 'package:medicament_project/Screens/DashboardDelievery/dashboard_screen.dart';
import 'package:medicament_project/Screens/Login/components/background.dart';
import 'package:medicament_project/Screens/Signup/signup_screen.dart';
import 'package:medicament_project/components/already_have_an_account_acheck.dart';
import 'package:medicament_project/components/rounded_button.dart';
import 'package:medicament_project/components/rounded_input_field.dart';
import 'package:medicament_project/components/rounded_password_field.dart';
import 'package:medicament_project/Models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User user = User("", "", "", "", "", "", "");
  String url = "http://127.0.0.1:8000/api/Login";
  var token;
  var usertype = [];
  _save(String token,String id) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    prefs.setString("id_livreur", id);

  }

  Future save(context) async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': user.email,
          'password': user.password,
        }));
    print(res.body);
    var data = json.decode(res.body);

    if (res.body.contains("Client") == true) {
      _save(data["access_token"],data["idd"].toString());
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreen(),
          ));
    }
    if (res.body.contains("Livreur") == true) {
      _save(data["access_token"],data["idd"].toString());
      await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DashboardScreenDelievery(),
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
              "LOGIN",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.purpleAccent),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            SvgPicture.asset(
              "assets/icons/Medicine-bro.svg",
              height: MediaQuery.of(context).size.height * 0.35,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            RoundedInputField(
              hintText: "Your E-mail",
              onChanged: (values) {
                user.email = values;
              },
            ),
            RoundedPasswordField(
              onChanged: (values) {
                user.password = values;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                save(context);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            AlreadyHaveAnAccountCheck(
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
