import 'package:flutter/material.dart';

class EmailTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  const EmailTextfield({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,

      autofocus: false,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(),
      ),
    );
  }
}
