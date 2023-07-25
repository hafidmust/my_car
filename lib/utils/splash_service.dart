import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_car/ui/dashboard/dashboard_screen.dart';

import '../ui/authentication/signin_screen.dart';

class SplashService {
  void checkLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user == null) {
      Timer(
          const Duration(seconds: 5),
          () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SigninScreen(),
              )));
    } else {
      Timer(
        const Duration(seconds: 3),
        () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const DashboardScreen(),
          ),
        ),
      );
    }
  }
}
