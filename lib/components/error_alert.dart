import 'package:flutter/material.dart';

class ErrorAlert extends StatelessWidget {
  final String message;

  const ErrorAlert({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        style: TextStyle(fontSize: 20),
        'Error Occured!',
      ),
      content: Flexible(child: Text(message)),
      actions: [
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
