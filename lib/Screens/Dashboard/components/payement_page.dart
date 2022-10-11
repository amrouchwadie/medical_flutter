import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int current = 0;

  Object get index => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color(0xFF545068),
          ),
          onPressed: () {
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
        title: Text(
          'Payement',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Color(0xFF545068),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 199,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 16, right: 6),
              itemCount: toString().length,
              itemBuilder: (contxt, index) {
                return Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 199,
                  width: 299,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    color: Colors.blue,
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        child: Image.asset("assets/images/main_top.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/images/main_bottom.png',
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 48,
                        child: Text(
                          "Card Number",
                          style: TextStyle(
                              fontFamily: 'Varela',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        top: 69,
                        child: Text(
                          "**** **** **** 1425",
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      Positioned(
                        height: 28,
                        width: 445,
                        left: 21,
                        top: 40,
                        child: Image.asset("assets/images/mastercard.png",
                            width: 27, height: 27),
                      ),
                      Positioned(
                        left: 29,
                        bottom: 45,
                        child: Text(
                          "CARD HOLDERNAME",
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.black),
                        ),
                      ),
                      Positioned(
                        left: 29,
                        bottom: 21,
                        child: Text(
                          "BOUKIR AMROUCH",
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Positioned(
                        left: 202,
                        bottom: 45,
                        child: Text(
                          "EXPIRY DATE",
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                      ),
                      Positioned(
                        left: 202,
                        bottom: 21,
                        child: Text(
                          "21-06-2021",
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 5,
            child: ListView.builder(
                itemCount: toStringShort().length,
                padding: EdgeInsets.only(left: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column();
                }),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Transactions History',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Image.asset("assets/images/dolipran.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Doliprane 1000mg",
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        '-24.99 MAD',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        'APPROVED',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Image.asset("assets/images/asprine.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Asprine 500mg",
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        '-35.99 MAD',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        'APPROVED',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.green, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF5F6F9),
                          borderRadius: BorderRadius.circular(13),
                        ),
                        child: Image.asset("assets/images/vagisal.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.09),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Burnoll 200mg",
                        style: TextStyle(
                            fontFamily: 'Varela',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        '+75.99 MAD',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Text(
                        'DENIED',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Colors.red, fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
