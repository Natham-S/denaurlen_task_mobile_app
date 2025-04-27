import 'package:flutter/material.dart';

import '../../Services/ApiService.dart';
import '../../models/Credentials.dart';
import '../../screens/CoinValuationScreen.dart';


class CredentialsSubmitBtn extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController usernameController;

  const CredentialsSubmitBtn({super.key,
    required this.nameController,
    required this.usernameController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.0),
        ),
        child: Text(
          "Submit",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        onPressed: () async {
          final name = nameController.text;
          final username = usernameController.text;

          if (name.isNotEmpty && username.isNotEmpty) {
            final creds = Credentials(name: name, username: username);

            try {
              bool isVerified = await ApiService.sendCredentials(creds);
              if (isVerified) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CoinValuationScreen(username: username),
                  ),
                );
              }
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('User not found/ invalid credentials'),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          }
        },
      ),
    );
  }
}