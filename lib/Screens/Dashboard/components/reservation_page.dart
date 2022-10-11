import 'package:flutter/material.dart';
import 'package:medicament_project/Screens/Dashboard/dashboard_screen.dart';
import 'package:medicament_project/components/rounded_button.dart';
import 'package:medicament_project/components/rounded_button2.dart';
import 'package:medicament_project/components/rounded_input_field.dart';
import 'package:medicament_project/components/rounded_input_field2.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'dart:html' as h;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:medicament_project/Models/Demandemedicament.dart';
import 'dart:convert';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medicament_project/Screens/Dashboard/components/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReservationPage extends StatefulWidget {
  final  valuee;
  ReservationPage({Key key,@required this.valuee}) : super(key: key);
  @override
  _ReservationPageState createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  Demande dmd = Demande(description: "", demande_image: "");
  h.File infos;
  String _imageInfo = '';

  Future<Uint8List> _getHtmlFileContent(h.File blob) async {
    
    Uint8List file;
    final reader = h.FileReader();
    reader.readAsDataUrl(blob.slice(0, blob.size, blob.type));
    reader.onLoadEnd.listen((event) {
      Uint8List data =
          Base64Decoder().convert(reader.result.toString().split(",").last);
      file = data;
    }).onData((data) {
      file = Base64Decoder().convert(reader.result.toString().split(",").last);
      return file;
    });
    while (file == null) {
      await new Future.delayed(const Duration(milliseconds: 1));
      if (file != null) {
        break;
      }
    }
    return file;
  }

  Future Save() async {
    final prefs = await SharedPreferences.getInstance();
    String urlApi = "http://127.0.0.1:8000/api/Demande";
    if (infos != null) {
      Uri uri = Uri.parse(urlApi);
      var request = http.MultipartRequest('POST', uri);
      request.fields['description'] = dmd.description;
      request.fields['id_pharmacie'] = widget.valuee;
      request.fields['id_user'] = prefs.get('id_livreur');
      request.files.add(http.MultipartFile.fromBytes(
          'demande_image', (await _getHtmlFileContent(infos)),
          filename: infos.name));
      request.send();
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(),
        ));
  }

  Future<void> _getImgFile() async {
    infos = await ImagePickerWeb.getImage(outputType: ImageType.file);
    setState(() => _imageInfo =
        'Name: ${infos.name}\nRelative Path: ${infos.relativePath}');
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
          'Reservation',
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
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "DEMANDE MEDICATION",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.lightBlueAccent),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                SvgPicture.asset(
                  "assets/icons/pills.svg",
                  height: MediaQuery.of(context).size.height * 0.35,
                ),
                RoundedInputField2(
                  hintText: "Medicine Name",
                  onChanged: (values) {
                    dmd.description = values;
                  },
                ),
                FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.photo_library, color: Colors.blue),
                      SizedBox(
                        width: 5,
                      ),
                      Text("Select Prescription"),
                    ],
                  ),
                  onPressed: _getImgFile,
                ),
                RoundedButton2(
                  text: "Reserver",
                  press: () {
                    Save();
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
