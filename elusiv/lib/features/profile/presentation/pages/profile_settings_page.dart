import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GoNamedBackButtonTesting(name: AppRoute.profilePage.name),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Change Profile Picture'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Change Username'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Change Password'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Delete Account'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}