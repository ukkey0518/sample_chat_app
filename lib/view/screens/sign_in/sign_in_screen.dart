import 'package:flutter/material.dart';
import 'package:sample_chat_app/view/screens/sign_in/components/sign_in_form.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
