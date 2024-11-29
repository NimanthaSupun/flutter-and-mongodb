import 'dart:convert';

import 'package:flutter_client/models/user_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "http://localhost:5000/api/users";

class UserServices {
  // todo: Create user
  Future<void> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode(user.toJson()),
      );
      if (response.statusCode != 200) {
        print("Failed to create user: ${response.statusCode}");
        throw Exception("failed to create user");
      } else {
        print("User create successful");
      }
    } catch (error) {
      print("Error Creating user: $error");
      rethrow;
    }
  }
}
