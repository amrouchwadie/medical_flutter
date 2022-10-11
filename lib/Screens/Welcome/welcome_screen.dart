import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Welcome/components/background.dart';
import 'package:medicament_project/Screens/Welcome/components/body.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
          ),
        ),
        tooltip: 'Google map',
        child: Icon(
          Icons.pin_drop_outlined,
          size: 20,
        ),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
