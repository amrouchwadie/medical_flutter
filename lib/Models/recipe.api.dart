import 'dart:convert';
import 'package:medicament_project/models/recipe.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    final prefs = await SharedPreferences.getInstance();
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/get_demande_by_livreur/'+prefs.get('id_livreur')));

    final json = "[" + response.body + "]";
    print ("data of demande"+json);
    List data = jsonDecode(response.body);

    return Recipe.recipesFromSnapshot(data);
  }
}
