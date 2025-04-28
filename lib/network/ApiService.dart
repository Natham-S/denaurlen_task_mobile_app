import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Credentials.dart';
import '../models/PostData.dart';


class ApiService {
  static const String baseUrl = "http://192.168.220.1:8080";

  static Future<bool> sendCredentials(Credentials credentials) async {
    try {
      final url = Uri.parse("$baseUrl/credentials");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(credentials.toJson()),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception("Failed to verify credentials: ${response.body}");
      }
    } catch (e) {
      throw Exception("Unable to connect to server: $e");
    }
  }

  static Future<PostData> fetchPostData() async {
    final url = Uri.parse("$baseUrl/getpostdata");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final body = json.decode(response.body);
      return PostData.fromJson(body);
    } else {
      print('Backend error: ${response.statusCode} ${response.body}');
      throw Exception("Failed to fetch post data");
    }
  }


  static Future<void> performLead(String username) async {
    final url = Uri.parse("$baseUrl/lead?username=$username");
    final response = await http.post(url);

    if (response.statusCode != 200) {
      throw Exception("Failed to perform Lead +100");
    }
  }


}
