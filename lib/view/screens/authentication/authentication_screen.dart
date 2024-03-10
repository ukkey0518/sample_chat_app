import 'package:flutter/material.dart';
import 'package:sample_chat_app/view/screens/authentication/components/sign_in_form.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const PopScope(
      canPop: false,
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SignInForm(),
          ),
        ),
      ),
    );
  }
}
