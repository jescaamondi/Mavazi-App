import 'package:flutter/foundation.dart';
import 'package:mavazi/models/api_error.dart';
import 'package:mavazi/services/auth_api.dart';
import 'package:mavazi/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { unauthenticated, authenticated }

class AuthViewModel extends ChangeNotifier {
  final AuthApi _authApi;
  bool isLoading = false;
  autoLogin()


  User? user;
  String? errorMessage;

  static const String ACCESS_TOKEN_KEY = "access_token_key";
  static const String REFRESH_TOKEN_KEY = "refresh_token_key";
  AuthStatus authStatus = AuthStatus.unauthenticated;

  AuthViewModel({AuthApi? authApi}) : _authApi = authApi ?? AuthApi();

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    try {
      errorMessage = null;
      var result = await _authApi.login(username, password);
      user = result.user;
      await saveUserTokens(result.accessToken, result.refreshToken);
      authStatus = AuthStatus.authenticated;
      return true;
    } on ApiError catch (e) {
      errorMessage = e.message;
      authStatus = AuthStatus.unauthenticated;
      return false;
    } catch (e) {
      errorMessage = e.toString();
      authStatus = AuthStatus.unauthenticated;
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> saveUserTokens(String accessToken, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(ACCESS_TOKEN_KEY, accessToken);
    await prefs.setString(REFRESH_TOKEN_KEY, refreshToken);
  }

  Future<void> authLogin() async {
    final prefs = await SharedPreferences.getInstance();
    String? accessToken = prefs.getString(ACCESS_TOKEN_KEY);
    String? refreshToken = prefs.getString(REFRESH_TOKEN_KEY);
    if (accessToken != null && refreshToken != null) {
      authStatus = AuthStatus.authenticated;
    } else {
      authStatus = AuthStatus.unauthenticated;
    }
    notifyListeners();
  }
  Future<void> logout() async{
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(ACCESS_TOKEN_KEY);
    prefs.remove(REFRESH_TOKEN_KEY);
    authStatus = AuthStatus.unauthenticated;
    notifyListeners();
  }
}
final token response = await _authApi.refresh(refrechToken):class
return CircularProgressI dicator();
}},