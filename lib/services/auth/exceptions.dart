import 'package:auth/components/error_alert.dart';
import 'package:flutter/material.dart';

class MainExceptions {
  void loginExceptions(
    BuildContext context,
    String exception,
    String message,
  ) {
    switch (exception) {
      case 'user-disabled':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'user-not-found':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'operation-not-allowed':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'wrong-password':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'too-many-requests':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'network-request-failed':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      case 'invalid-credential':
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(message: message);
          },
        );
        break;
      default:
        showDialog(
          context: context,
          builder: (context) {
            return ErrorAlert(
              message:
                  'An Error Occoured... Please try again',
            );
          },
        );
        break;
    }
  }
}
