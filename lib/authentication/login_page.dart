import 'package:auth/components/auth_button.dart';
import 'package:auth/components/email_textfield.dart';
import 'package:auth/components/password_textfield.dart';
import 'package:auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController loginEmail;
  final TextEditingController loginPassword;
  final Function()? onTap;
  const LoginPage({
    super.key,
    required this.onTap,
    required this.loginEmail,
    required this.loginPassword,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        // Provider.of<AuthProvider>(context).incrementBeans();
        // context.read<AuthProvider>().incrementBeans();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(style: TextStyle(fontSize: 30), 'Login'),
              SizedBox(height: 15),
              Column(
                spacing: 15,
                children: [
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text('Email'),
                      EmailTextfield(
                        hint: 'Enter Email',
                        controller: loginEmail,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text('Password'),
                      PasswordTextfield(
                        hint: 'Enter Password',
                        controller: loginPassword,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              AuthButton(
                text: 'Login',
                onTap: () {
                  Provider.of<AuthProviderr>(
                    context,
                    listen: false,
                  ).login(
                    loginEmail.text,
                    loginPassword.text,
                    context,
                  );
                },
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  onTap!();
                  loginEmail.clear();
                  loginPassword.clear();
                },

                child: Row(
                  spacing: 5,
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  children: [
                    Text('Don\'t you have an Account?'),
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      'Create Account',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
