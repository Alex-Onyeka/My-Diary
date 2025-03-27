import 'package:auth/authentication/login_page.dart';
import 'package:auth/authentication/sign_up_page.dart';
import 'package:flutter/material.dart';

class AuthenticationPlate extends StatefulWidget {
  const AuthenticationPlate({super.key});

  @override
  State<AuthenticationPlate> createState() =>
      _AuthenticationPlateState();
}

class _AuthenticationPlateState
    extends State<AuthenticationPlate> {
  //
  //
  //
  TextEditingController loginEmail =
      TextEditingController();
  TextEditingController loginPassword =
      TextEditingController();
  //
  TextEditingController signUpEmail =
      TextEditingController();
  TextEditingController signUpPassword =
      TextEditingController();
  TextEditingController signUpConfirmPassword =
      TextEditingController();
  //
  //
  //
  bool isLogin = true;
  //
  //
  @override
  void dispose() {
    super.dispose();
    loginEmail.dispose();
    loginPassword.dispose();
    signUpConfirmPassword.dispose();
    signUpEmail.dispose();
    signUpPassword.dispose();
  }

  //
  @override
  Widget build(BuildContext context) {
    if (isLogin) {
      return LoginPage(
        onTap: () {
          setState(() {
            isLogin = false;
          });
        },
        loginEmail: loginEmail,
        loginPassword: loginPassword,
      );
    } else {
      return SignUpPage(
        onTap: () {
          setState(() {
            isLogin = true;
          });
        },
        signUpConfirmPassword: signUpConfirmPassword,
        signUpEmail: signUpEmail,
        signUpPassword: signUpPassword,
      );
    }
  }
}
