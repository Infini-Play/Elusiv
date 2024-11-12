import 'package:elusiv/core/common_widgets/test_widgets/go_named_back_button_testing.dart';
import 'package:elusiv/core/navigation/routing.dart';
import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({super.key});

  // Draw dialogue box to confirm account deletion
  void confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Account'),
          content: const Text(
              'Are you sure you want to delete your account? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                // TODO: Add account deletion logic 
								// 			 Need Maksim to update backend first
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

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
              title: const Text('Delete Account',
                  style: TextStyle(color: Colors.red)),
              onTap: () => confirmDeleteAccount(context)),
        ],
      ),
    );
  }
}
