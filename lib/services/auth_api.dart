import 'dart:convert';

import 'package:mavazi/models/api_error.dart';
import 'package:mavazi/models/login_results.dart';
import 'package:http/http.dart' as http;
import 'package:mavazi/models/token_response.dart';
import 'package:mavazi/models/user.dart';

class AuthApi {
  static const baseUrl = 'https://dummyjson.com';

  Future<LoginResults> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': username, 'password': password}),
    );
    if (response.statusCode != 200) {
      var errorBody = jsonDecode(response.body);
      throw ApiError(message: errorBody['message'] ?? 'Login failed');
    }

    var responseJson = jsonDecode(response.body);
    return LoginResults(
      user: User.fromJson(responseJson),
      accessToken: responseJson['accessToken'],
      refreshToken: responseJson['refreshToken'],
    );
  }

  Future<User> fetchCurrentUser(String accessToken) async {
    final response = await http.get(
      Uri.parse('$baseUrl/auth/me'),
      headers: {'Authorization': 'Bearer $accessToken'},
    );
    if (response.statusCode != 200) {
      var errorBody = jsonDecode(response.body);
      throw ApiError(message: errorBody['message'] ?? 'Could not load user');
    }

    var responseJson = jsonDecode(response.body);
    return User.fromJson(responseJson);
  }

  Future<TokenResponse> refresh(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/refresh'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'refreshToken': refreshToken}),
    );
    if (response.statusCode != 200) {
      var errorBody = jsonDecode(response.body);
      throw ApiError(message: errorBody['message'] ?? 'Session expired');
    }

    var responseJson = jsonDecode(response.body);
    return TokenResponse.fromJson(responseJson);
  }
}
