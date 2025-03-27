import 'package:auth/components/error_alert.dart';
import 'package:auth/providers/auth_provider.dart';
import 'package:auth/services/auth/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  MainExceptions exception = MainExceptions();

  void trackUserLoggedIn(User? user) {
    auth.authStateChanges().listen((User? newUser) {
      user = newUser;
    });
  }

  Future<void> createUser(
    String email,
    String password,
    BuildContext context,
  ) async {
    UserCredential? userCredential = await auth
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

    User? user = userCredential.user;

    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      if (!context.mounted) return;
      Provider.of<AuthProviderr>(
        context,
        listen: false,
      ).sendEmailVerification();
    }
  }

  Future<void> login(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      if (!context.mounted) return;
      exception.loginExceptions(
        context,
        e.code,
        e.message.toString(),
      );
    }
  }

  Future<void> sendVerificationEmail(
    BuildContext context,
  ) async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } on FirebaseException catch (e) {
      ErrorAlert(message: e.message.toString());
    }
  }

  void logout() {
    auth.signOut();
  }
}
