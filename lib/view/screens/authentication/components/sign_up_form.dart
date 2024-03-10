import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_chat_app/services/authentication_service.dart';
import 'package:sample_chat_app/utils/show_snack_bar.dart';
import 'package:sample_chat_app/view/screens/authentication/authentication_screen.dart';

/// Sign-up form
///
/// This widget is a form for signing up with email and password.
/// It is used in [AuthenticationScreen].
class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isProcessing = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Sign up with email and password
    Future<void> signUp() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (email.isEmpty || password.isEmpty) {
        await showSnackBar(
          context,
          'メールアドレスとパスワードを入力してね！',
        );
        return;
      }

      try {
        isProcessing.value = true;
        await AuthenticationService.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      } catch (e) {
        if (context.mounted) {
          unawaited(showErrorSnackBar(context, e));
        }
      } finally {
        isProcessing.value = false;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sign up',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: emailController,
          enabled: !isProcessing.value,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: passwordController,
          enabled: !isProcessing.value,
          decoration: const InputDecoration(
            labelText: 'Password',
          ),
        ),
        const SizedBox(height: 16),
        if (isProcessing.value)
          const CircularProgressIndicator()
        else
          ElevatedButton(
            onPressed: signUp,
            child: const Text('登録する'),
          ),
      ],
    );
  }
}
