import 'package:flutter/material.dart';

class PasswordTextfield extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  const PasswordTextfield({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: true,
      autocorrect: false,
      autofocus: false,
      enableSuggestions: false,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hint,
      ),
    );
  }
}
