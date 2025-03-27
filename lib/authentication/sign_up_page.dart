import 'package:auth/components/auth_button.dart';
import 'package:auth/components/email_textfield.dart';
import 'package:auth/components/password_textfield.dart';
import 'package:auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController signUpEmail;
  final TextEditingController signUpPassword;
  final TextEditingController signUpConfirmPassword;
  final Function()? onTap;
  const SignUpPage({
    super.key,
    required this.onTap,
    required this.signUpEmail,
    required this.signUpPassword,
    required this.signUpConfirmPassword,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Text(
                style: TextStyle(fontSize: 30),
                'Create Account',
              ),
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
                        controller: signUpEmail,
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
                        controller: signUpPassword,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      Text('Confirm Password'),
                      PasswordTextfield(
                        hint: 'Confirm Password',
                        controller: signUpConfirmPassword,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15),
              AuthButton(
                text: 'Create Account',
                onTap: () {
                  Provider.of<AuthProviderr>(
                    context,
                    listen: false,
                  ).signIn(
                    signUpEmail.text,
                    signUpPassword.text,
                    context,
                  );
                },
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () {
                  onTap!();
                  signUpEmail.clear();
                  signUpPassword.clear();
                  signUpConfirmPassword.clear();
                },
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text('Do you have an Account?'),
                    Text(
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      'Login',
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
