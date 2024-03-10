import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_chat_app/constants/app_font_family.dart';
import 'package:sample_chat_app/view/screens/authentication/components/sign_in_form.dart';
import 'package:sample_chat_app/view/screens/authentication/components/sign_up_form.dart';

class AuthenticationScreen extends HookWidget {
  const AuthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formType = useState(AuthenticationFormType.signIn);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switch (formType.value) {
                    AuthenticationFormType.signIn => 'Sign in',
                    AuthenticationFormType.signUp => 'Sign up',
                  },
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontFamily: AppFontFamily.marugameUdon,
                      ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: switch (formType.value) {
                    AuthenticationFormType.signIn => const SignInForm(),
                    AuthenticationFormType.signUp => const SignUpForm(),
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      formType.value = switch (formType.value) {
                        AuthenticationFormType.signIn =>
                          AuthenticationFormType.signUp,
                        AuthenticationFormType.signUp =>
                          AuthenticationFormType.signIn,
                      };
                    },
                    child: Text(
                      switch (formType.value) {
                        AuthenticationFormType.signIn => '新規登録する',
                        AuthenticationFormType.signUp => 'ログインする',
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthenticationFormType { signIn, signUp }
