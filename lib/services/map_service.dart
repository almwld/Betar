import 'dart:convert';
import 'package:http/http.dart' as http;

class MapService {
  static const String _nominatimUrl = 'https://nominatim.openstreetmap.org';

  static Future<Map<String, dynamic>?> getAddressFromCoordinates(double lat, double lon) async {
    try {
      final url = '$_nominatimUrl/reverse?format=json&lat=$lat&lon=$lon&zoom=18&addressdetails=1';
      final response = await http.get(Uri.parse(url), headers: {'User-Agent': 'FlexYemen/1.0'});
      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      print('Error reverse geocoding: $e');
      return null;
    }
  }

  static Future<List<Map<String, dynamic>>> searchLocation(String query) async {
    try {
      final url = '$_nominatimUrl/search?format=json&q=$query&limit=10';
      final response = await http.get(Uri.parse(url), headers: {'User-Agent': 'FlexYemen/1.0'});
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(json.decode(response.body));
      }
      return [];
    } catch (e) {
      print('Error searching location: $e');
      return [];
    }
  }
}