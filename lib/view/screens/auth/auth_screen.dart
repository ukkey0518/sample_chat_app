import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sample_chat_app/l10n/l10n.dart';
import 'package:sample_chat_app/view/screens/auth/components/sign_in_form.dart';
import 'package:sample_chat_app/view/screens/auth/components/sign_up_form.dart';

class AuthScreen extends HookWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final currentFormType = useState(AuthenticationFormType.signIn);

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    L10n.of(context)!.authTitle(currentFormType.value.name),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: switch (currentFormType.value) {
                      AuthenticationFormType.signIn => const SignInForm(),
                      AuthenticationFormType.signUp => const SignUpForm(),
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => currentFormType.value =
                          currentFormType.value.toggled(),
                      child: Text(
                        L10n.of(context)!
                            .authToggleFormButton(currentFormType.value.name),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthenticationFormType {
  signIn,
  signUp;

  AuthenticationFormType toggled() => switch (this) {
        AuthenticationFormType.signIn => AuthenticationFormType.signUp,
        AuthenticationFormType.signUp => AuthenticationFormType.signIn,
      };
}
