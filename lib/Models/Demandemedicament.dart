class Demande {
  String description;
  String demande_image;
  Demande({this.description, this.demande_image});

  factory Demande.fromJson(dynamic json) {
    return Demande(
        description: json['description'] as String,
        demande_image: json['demande_image'] as String);
  }

  static List<Demande> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Demande.fromJson(data);
    }).toList();
  }
}
