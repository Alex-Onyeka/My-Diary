import 'package:auth/components/auth_button.dart';
import 'package:auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 35.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Click on the Button to send Verification Email',
              ),
            ),
            SizedBox(height: 20),
            AuthButton(
              text:
                  Provider.of<AuthProviderr>(
                        context,
                      ).emailVerificationSent
                      ? 'Check Your Mail And Verify'
                      : 'Send Verification Email',
              onTap: () {
                Provider.of<AuthProviderr>(
                          context,
                          listen: false,
                        ).emailVerificationSent ==
                        false
                    ? Provider.of<AuthProviderr>(
                      context,
                      listen: false,
                    ).verifyUser(context)
                    : Provider.of<AuthProviderr>(
                      context,
                      listen: false,
                    ).logOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
