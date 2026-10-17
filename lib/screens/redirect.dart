import 'package:flutter/cupertino.dart';
import 'package:mavazi/screens/home_screen.dart';
import 'package:mavazi/screens/login_screen.dart';
import 'package:mavazi/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class Redirect extends StatelessWidget {
  const Redirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, child) {
        var status = authViewModel.authStatus;
        switch (status) {
          case AuthStatus.unauthenticated:
            return const LoginScreen();
          case AuthStatus.authenticated:
            return const HomeScreen();
        }
      },
    );
  }
}