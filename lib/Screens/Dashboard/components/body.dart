import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Dashboard/components/edit_profile.dart';
import 'package:medicament_project/Screens/Dashboard/components/panel_screen.dart';
import 'package:medicament_project/Screens/Dashboard/components/payement_page.dart';
import 'package:medicament_project/Screens/Dashboard/components/pharmacie_screen.dart';
import 'package:medicament_project/Screens/Dashboard/components/reservation_page.dart';
import 'package:medicament_project/Screens/Dashboard/components/store.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';
import 'package:medicament_project/Screens/Dashboard/components/index.dart';
import 'package:medicament_project/Screens/Dashboard/components/homepage.dart';
import 'package:medicament_project/Screens/DashboardDelievery/dashboard_screen.dart';
import 'package:medicament_project/Screens/Login/login_screen.dart';

import 'package:medicament_project/main.dart';

void main() => runApp(Body());

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/user.png"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Client Zero",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.tealAccent,
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return DashboardScreen();
                    },
                  ),
                );
              },
            ),


            ListTile(
              title: Text(' Panel'),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return IndexPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text(' Pharma'),
              leading: Icon(Icons.local_police_outlined),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PharmaPage();
                    },
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return EditProfilePage();
                    },
                  ),
                );
              },
            ),
            const Divider(
              height: 10,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.more),
              onTap: () {},
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.logout),
              onTap: () {
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(),
        ),
        tooltip: 'Google map',
        child: Icon(
          Icons.pin_drop_outlined,
          size: 20,
        ),
        backgroundColor: Colors.teal,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
      backgroundColor: Color(0xFF21BFBD),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 6.0,
                        spreadRadius: 4.0,
                        offset: Offset(0.0, 0.3),
                      ),
                    ],
                    color: Color(0xFFC6E7FE),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("assets/images/user.png"),
                        fit: BoxFit.contain),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 38.0),
            child: Row(
              children: <Widget>[
                Text("Welcome,",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white)),
                SizedBox(width: 10),
                Text(
                  "Client Zero",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15.0),
          Container(
            height: MediaQuery.of(context).size.height + 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(65.0),
              ),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 15.0, right: 20),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height + 200.0,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        _BuildListItem(
                            'Dashboard',
                            'assets/images/pharmacy.png',
                            Color(0xFFFFE9C6),
                            Color(0xFFDA9551)),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        _BuildSecondListItem(
                            'Pharmacie',
                            'assets/images/delivery-man.png',
                            Color(0xFF2196F3),
                            Color(0xFFFFFFFF),
                            context),
                        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                        _BuildThirdListItem(
                            'Payement History',
                            'assets/images/hand.png',
                            Color(0xFF90EE90),
                            Color(0xFF008000),
                            context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_BuildListItem(String write, String imgPath, Color bgColor, Color textColor) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: InkWell(
      onTap: () {},
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: write,
              child: Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              write,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  );
}

_BuildSecondListItem(
    String write, String imgPath, Color bgColor, Color textColor, context) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PharmaPage()),
        );
      },
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: write,
              child: Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              write,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  );
}

_BuildThirdListItem(
    String write, String imgPath, Color bgColor, Color textColor, context) {
  return Padding(
    padding: EdgeInsets.only(left: 15.0),
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PaymentPage()),
        );
      },
      child: Container(
        height: 175.0,
        width: 150.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: bgColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: write,
              child: Container(
                height: 75.0,
                width: 75.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Image.asset(imgPath, height: 50.0, width: 50.0),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Text(
              write,
              style: TextStyle(color: textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    ),
  );
}
