import 'package:auth/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProviderr with ChangeNotifier {
  User? _user;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late FirebaseAuth _auth;
  AuthService authService = AuthService();

  AuthProviderr() {
    _auth = authService.auth;
    _user = _auth.currentUser;
    _authListener();
  }

  User? get user => _user;

  // void _authListener() {
  //   authService.trackUserLoggedIn(user);
  // }

  void _authListener() {
    _auth.authStateChanges().listen((User? newUser) {
      _user = newUser;
      notifyListeners();
    });
  }

  Future login(
    String email,
    String password,
    BuildContext context,
  ) async {
    await authService.login(email, password, context);
  }

  // Future<String> login(
  //   String email,
  //   String password,
  // ) async {
  //   await _auth.signInWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );

  //   return 'Success';
  // }

  Future signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    await authService.createUser(email, password, context);
  }

  // Future<String> signIn(
  //   String email,
  //   String password,
  // ) async {
  //   await _auth.createUserWithEmailAndPassword(
  //     email: email,
  //     password: password,
  //   );

  //   return 'Success';
  // }

  void logOut() {
    authService.logout();
  }

  // void logOut() async {
  //   await _auth.signOut();
  // }

  bool emailVerificationSent = false;

  void sendEmailVerification() {
    emailVerificationSent = true;
    notifyListeners();
  }

  void verifyUser(BuildContext context) async {
    await authService.sendVerificationEmail(context);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Email Verification Sent!')),
    );
    sendEmailVerification();
    authService.logout();
  }
}
