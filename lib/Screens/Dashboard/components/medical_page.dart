import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Dashboard/components/medical_detail.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class MedicalPage extends StatefulWidget {
  @override
  _MedicalPageState createState() => _MedicalPageState();
}

class _MedicalPageState extends State<MedicalPage> {
  List<dynamic> medicaments = [];
  bool isLoading = false;

  Future<List<dynamic>> fetchmedicaments() async {
    setState(() {
      isLoading = true;
    });
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Medicaments_get_all'));
    if(response.statusCode == 200){
      var items = json.decode(response.body);
      setState(() {
        medicaments = items;
        isLoading = false;
      });
    }else{
      medicaments = [];
      isLoading = false;
    }
    return medicaments;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 47.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Doliprane', '\DH20.99',
                    'assets/images/dolipran.jpg', false, false, context),

              ],
            ),
          ),
          SizedBox(height: 15.0),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavotire, context) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MedicalDetail(
                  assetPath: imgPath, medicalprice: price, medicalname: name)));
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ],
              color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                ),
              ),
              Hero(
                  tag: imgPath,
                  child: Container(
                    height: 77.0,
                    width: 77.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imgPath),
                        fit: BoxFit.contain,
                      ),
                    ),
                  )),
              SizedBox(height: 7.0),
              Text(price,
                  style: TextStyle(
                      color: Color(0xFF21BFBD),
                      fontFamily: 'Varela',
                      fontSize: 17.0)),
              Text(name,
                  style: TextStyle(
                      color: Color(0xFF575E67),
                      fontFamily: 'Varela',
                      fontSize: 15.0)),
              Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
              Padding(
                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (!added) ...[
                      Icon(Icons.shopping_basket,
                          color: Color(0xFFD17E50), size: 15.0),
                      Text('Add to cart',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontSize: 15.0))
                    ],
                    if (added) ...[
                      Icon(Icons.remove_circle_outline,
                          color: Color(0xFFD17E50), size: 15.0),
                      Text('3',
                          style: TextStyle(
                              fontFamily: 'Varela',
                              color: Color(0xFFD17E50),
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0)),
                      Icon(Icons.add_circle_outline,
                          color: Color(0xFFD17E50), size: 15.0),
                    ]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
