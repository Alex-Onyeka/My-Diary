import 'package:auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Provider.of<AuthProviderr>(
              context,
              listen: false,
            ).logOut();
          },
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Text('Home Page'),
          ),
        ),
      ),
    );
  }
}
