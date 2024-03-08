import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Chat App'),
      ),
      body: const Center(
        child: Text('Sign In Screen!'),
      ),
    );
  }
}
