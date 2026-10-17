import 'user.dart';

class LoginResults {
  final User user;
  final String accessToken, refreshToken;

  LoginResults({
    required this.user,
    required this.accessToken,
    required this.refreshToken,
  });
}