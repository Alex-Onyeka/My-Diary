import 'package:auth/authentication/authentication_plate.dart';
import 'package:auth/authentication/verify_email.dart';
import 'package:auth/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auth/providers/auth_provider.dart';

class AuthManager extends StatelessWidget {
  const AuthManager({super.key});

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<AuthProviderr>().user;
    final user = Provider.of<AuthProviderr>(context).user;
    if (user == null) {
      return AuthenticationPlate();
    } else {
      if (user.emailVerified == false) {
        return VerifyEmail();
      } else {
        return HomePage();
      }
    }
  }
}
