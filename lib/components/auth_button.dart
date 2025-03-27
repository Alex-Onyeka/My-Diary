import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const AuthButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            style: TextStyle(fontWeight: FontWeight.bold),
            text,
          ),
        ),
      ),
    );
  }
}
