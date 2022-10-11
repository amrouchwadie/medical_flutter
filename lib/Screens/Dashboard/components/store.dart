import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Dashboard/components/bottom_bar.dart';
import 'package:medicament_project/Screens/Dashboard/components/medical_page.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';

class store extends StatefulWidget {
  @override
  _storeState createState() => _storeState();
}

class _storeState extends State<store> with SingleTickerProviderStateMixin {
  TabController _tabController;
  _showFormDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (param) {
          return AlertDialog(
            actions: [
              FlatButton(
                color: Colors.red,
                onPressed: () {},
                child: Text('Cancer'),
              ),
              FlatButton(
                color: Colors.teal,
                onPressed: () {},
                child: Text('Reserve'),
              ),
            ],
            title: Text("Reservation medicament"),
            content: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Medicine Name',
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Age',
                    ),
                  ),
                  OutlineButton(
                    onPressed: () {},
                    child: Text(
                      "Upload Prescription",
                      style: TextStyle(fontSize: 17.0),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
          'Storage',
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
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(
            height: 15.0,
          ),
          Text('Medical Store',
              style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 38.0,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(
            height: 15.0,
          ),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFF21BFBD),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text(
                    'Medicine',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pills',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    'Creams',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    ),
                  ),
                ),
              ]),
          Container(
            height: MediaQuery.of(context).size.height - 47.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                MedicalPage(),
                MedicalPage(),
                MedicalPage(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFormDialog(context);
        },
        backgroundColor: Color(0xFF21BFBD),
        child: Icon(Icons.medical_services),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
