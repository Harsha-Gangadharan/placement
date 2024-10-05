import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  Future<void> registerUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      final responseData = jsonDecode(response.body);
      throw Exception(responseData['error'] ?? 'Registration failed');
    }
  }

  Future<List<dynamic>> fetchUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=1'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<List<dynamic>> fetchColors() async {
    final response = await http.get(Uri.parse('$baseUrl/unknown'));

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['data'];
    } else {
      throw Exception('Failed to load colors');
    }
  }
}
