
import 'dart:convert';

import 'package:mavazi/models/api_error.dart';
import 'package:mavazi/models/login_results.dart';
import 'package:http/http.dart' as http;
import 'package:mavazi/models/user.dart';


class AuthApi {
  static const baseUrl='https://dummyjson.com';

  Future<LoginResults> login(String username, String password) async{
    final response = await http.post(Uri.parse('$baseUrl/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'username': username, 'password':password}),
    );
    if(response.statusCode !=200){
      var errorBody = jsonDecode(response.body);
      throw ApiError(message: errorBody['message']?? 'login Failed');
      }

      var responseJson = jsonDecode(response.body);
      return LoginResults(user: User.fromJson(responseJson),
       accessToken: responseJson['accessToken'],
       refreshToken: responseJson['refreshToken'],
       );

Future<User> fetchCurrentUser(String accessToken) async {
  final response = await http 
}
  }

}