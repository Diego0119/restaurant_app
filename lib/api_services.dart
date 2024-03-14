import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/Restaurant.dart';

class ApiService {
  static const String _apiKey = 'tu-api-key';
  static const String _apiUrl = 'https://api.yelp.com/v3/businesses/search';

  static Future<List<Restaurant>> fetchRestaurants(
      {String location = 'Santiago'}) async {
    final response = await http.get(
      Uri.parse('$_apiUrl?location=$location'),
      headers: {
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> businesses = jsonResponse['businesses'];

      List<Restaurant> restaurants =
          businesses.map((json) => Restaurant.fromJson(json)).toList();
      return restaurants;
    } else {
      throw Exception(
          'Error al hacer la solicitud a la API de Yelp: ${response.statusCode}');
    }
  }

  static Future<List<Restaurant>> fetchRestaurantsNearby({
    double latitude = 0.0,
    double longitude = 0.0,
    int radius = 2000,
  }) async {
    final url =
        '$_apiUrl?latitude=$latitude&longitude=$longitude&radius=$radius';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'Bearer $_apiKey',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final List<dynamic> businesses = jsonResponse['businesses'];

      List<Restaurant> restaurants =
          businesses.map((json) => Restaurant.fromJson(json)).toList();
      return restaurants;
    } else {
      throw Exception(
          'Error al hacer la solicitud a la API de Yelp: ${response.statusCode}');
    }
  }
}
