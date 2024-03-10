import 'package:flutter/material.dart';
import 'package:sample_chat_app/l10n/l10n.dart';
import 'package:sample_chat_app/services/authentication_service.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(
            Icons.logout,
            color: Theme.of(context).colorScheme.tertiary,
          ),
          onTap: AuthenticationService.signOut,
          title: Text(
            L10n.of(context)!.settingListTileSignOut,
            style: TextStyle(color: Theme.of(context).colorScheme.tertiary),
          ),
        ),
      ],
    );
  }
}
