import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String url = 'https://devsapihub.com/api-movies';

  static Future<List<dynamic>> obtenerPeliculas() async {
    final res = await http.get(Uri.parse(url));
    return json.decode(res.body);
  }

  static Future<void> guardar(Map peli) async {
    await http.post(Uri.parse(url), 
      headers: {'Content-Type': 'application/json'},
      body: json.encode(peli)
    );
  }

  static Future<void> eliminar(String id) async {
    await http.delete(Uri.parse('$url/$id'));
  }
}