import 'package:flutter/material.dart';
import 'package:flutter_image/flutter_image.dart';

class RecipeCard extends StatelessWidget {

  final String description;
  final String thumbnailUrl;
  final String status;
  final String message_refuse;
  final String id_client;
  final String id_demande;
  final String id_pharmacie;
  final String id_livreur ;
  final String Client_nom;
  final String Client_prenom;
  final String Client_adresse;
  final String Client_telephone;
  final String Client_email;
  RecipeCard({
    @required this.description,
    @required this.thumbnailUrl,
    @required this.status,
    @required this.message_refuse,
    @required this.id_client,
    @required this.id_demande,
    @required this.id_pharmacie,
    @required this.id_livreur,
    @required this.Client_nom,
    @required this.Client_prenom,
    @required this.Client_adresse,
    @required this.Client_telephone,
    @required this.Client_email,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(thumbnailUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                description,
                style: TextStyle(
                  fontSize: 19,
                   color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(

                    children: [

                      Text(status,style: TextStyle(color: Colors.white),),
                      SizedBox(width: 3),

                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [

                      SizedBox(width: 7),
                      Text(id_demande,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}
