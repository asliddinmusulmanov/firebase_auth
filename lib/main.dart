import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_firebase_auth/pages/auth_gate.dart';
import 'package:learn_firebase_auth/setup.dart';
import 'package:learn_firebase_auth/shared_preferens.dart';

Future<void> main() async {
  await setup();
  bool isLoading = await getLoginState();
  runApp(MyApp(isLogin: isLoading));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: isLogin ? const HomePage() : const SplashPages(),
      home: AuthGate(),
      // home: WelcomePage(),
    );
  }
}
