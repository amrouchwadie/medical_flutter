class Recipe {
  final String description;
  final String demande_image;
  final String status;
  final String message_refuse;
  final int id_client;
  final int id_demande;
  final int id_pharmacie;
  final int id_livreur ;
  final String Client_nom;
  final String Client_prenom;
  final String Client_adresse;
  final String Client_telephone;
  final String Client_email;
  Recipe(
      {this.description,
      this.demande_image,
      this.status,
      this.message_refuse,
      this.id_client,
      this.id_demande,
        this.id_pharmacie,
        this.id_livreur,
        this.Client_nom,
        this.Client_prenom,
        this.Client_adresse,
        this.Client_telephone,
        this.Client_email,});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        description: json['description'] as String,
        demande_image: json['demande_image'] as String,
        status: json['status'] as String,
        message_refuse: json['message_refuse'] as String,
        id_client: json['id_client'] as int,
        id_demande: json['id_demande'] as int,
        id_pharmacie: json['id_pharmacie'] as int,
        id_livreur: json['id_livreur'] as int,
        Client_nom: json['Client_nom'] as String,
        Client_prenom: json['Client_prenom'] as String,
        Client_adresse: json['Client_adresse'] as String,
        Client_email: json['Client_email'] as String,
        Client_telephone: json['Client_telephone'] as String)
    ;
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {description: $description, demande_image: $demande_image, status: $status,'
        ' message_refuse: $message_refuse, id_client: $id_client, id_demande: $id_demande,'
        ', id_pharmacie: $id_pharmacie, id_livreur: $id_livreur,Client_prenom: $Client_prenom,'
        ' Client_adresse: $Client_adresse, Client_email: $Client_email,'
        ' Client_telephone: $Client_telephone, Client_nom: $Client_nom}';
  }
}
