import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';
import 'package:medicament_project/Models/Demandemedicament.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class PanelPage extends StatefulWidget {
  @override
  _PanelPageState createState() => _PanelPageState();
}

class _PanelPageState extends State<PanelPage> {
  List<Demande> _demande;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();

  }

  Future<void> getRecipes() async {
    _demande = await getDemande();
    print(_demande.length);
    setState(() {
      _isLoading = false;
    });
  }

  static Future<List<Demande>> getDemande() async {
    final prefs = await SharedPreferences.getInstance();
    String token =prefs.get('token');
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Demande_client/'+token));
    List data = jsonDecode(response.body);
    return Demande.recipesFromSnapshot(data);
  }

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
          'Your Medicine',
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.39,
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
                    '24.99 MAD',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: Colors.green, fontSize: 25),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),

        ],
      ),
    );
  }
}
