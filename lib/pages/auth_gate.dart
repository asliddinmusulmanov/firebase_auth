import 'package:flutter/material.dart';
import 'package:learn_firebase_auth/pages/register_page.dart';
import 'package:learn_firebase_auth/pages/splash_page.dart';

import '../services/auth_services.dart';
import 'home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return HomePage(
            user: AuthService.auth.currentUser,
          );
        } else {
          return const SplashPages();
        }
        // return !snapshot.hasData
        //     ? HomePage(
        //         user: snapshot.data,
        //       )
        //     : const SplashPages();
      },
    );
  }
}
