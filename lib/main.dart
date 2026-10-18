import 'package:flutter/material.dart';
import 'package:mavazi/models/cart.dart';
import 'package:mavazi/screens/redirect.dart';
import 'package:mavazi/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()..autoLogin()),
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'PlayfairDisplay'),
        debugShowCheckedModeBanner: false,
        home: const Redirect(),
      ),
    );
  }
}
