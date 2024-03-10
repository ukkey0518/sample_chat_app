import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
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
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isProcessing = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    /// Sign up with email and password
    Future<void> signUp() async {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      if (!(formKey.currentState?.validate() ?? false)) {
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

    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Sign up',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: emailController,
            enabled: !isProcessing.value,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'メールアドレスを入力してね！'),
              FormBuilderValidators.email(errorText: 'メールアドレスの形式で入力してね！'),
            ]),
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: passwordController,
            enabled: !isProcessing.value,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            obscuringCharacter: '●',
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'パスワードを入力してね！'),
            ]),
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
      ),
    );
  }
}
