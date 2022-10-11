import 'package:http/http.dart' as http;
import 'package:medicament_project/Models/product.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Product>> fetchProducts() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:8000/api/Medicaments_get_all'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      //show error message
      return null;
    }
  }
}
