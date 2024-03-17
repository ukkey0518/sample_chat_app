import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_chat_app/l10n/l10n.dart';
import 'package:sample_chat_app/services/authentication_service.dart';
import 'package:sample_chat_app/utils/show_snack_bar.dart';
import 'package:sample_chat_app/view/screens/auth/auth_screen.dart';

/// Sign-up form
///
/// This widget is a form for signing up with email and password.
/// It is used in [AuthScreen].
class SignUpForm extends HookConsumerWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final isProcessing = useState(false);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final userNameController = useTextEditingController();

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
          TextFormField(
            controller: emailController,
            enabled: !isProcessing.value,
            keyboardType: TextInputType.emailAddress,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText:
                    L10n.of(context)!.authFormEmailValidationErrorRequired,
              ),
              FormBuilderValidators.email(
                errorText: L10n.of(context)!.authFormEmailValidationErrorFormat,
              ),
            ]),
            decoration: InputDecoration(
              labelText: L10n.of(context)!.authFormEmailLabel,
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
              FormBuilderValidators.required(
                errorText:
                    L10n.of(context)!.authFormPasswordValidationErrorRequired,
              ),
            ]),
            decoration: InputDecoration(
              labelText: L10n.of(context)!.authFormPasswordLabel,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: confirmPasswordController,
            enabled: !isProcessing.value,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            obscuringCharacter: '●',
            validator: FormBuilderValidators.equal(
              passwordController.text,
              errorText:
                  L10n.of(context)!.authFormConfirmPasswordValidationErrorMatch,
            ),
            decoration: InputDecoration(
              labelText: L10n.of(context)!.authFormConfirmPasswordLabel,
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: userNameController,
            enabled: !isProcessing.value,
            keyboardType: TextInputType.text,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText:
                    L10n.of(context)!.authFormUserNameValidationErrorRequired,
              ),
            ]),
            decoration: InputDecoration(
              labelText: L10n.of(context)!.authFormUserNameLabel,
            ),
          ),
          const SizedBox(height: 32),
          if (isProcessing.value)
            const CircularProgressIndicator()
          else
            ElevatedButton(
              onPressed: signUp,
              child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text('登録')),
              ),
            ),
        ],
      ),
    );
  }
}
