import 'package:denaurlen_task/ui/CustomTheme.dart';
import 'package:flutter/material.dart';

import '../Services/ApiService.dart';
import '../models/Credentials.dart';
import '../widgets/authScreen/CredentialsInputField.dart';
import 'CoinValuationScreen.dart';

class UserAuthScreen extends StatelessWidget {
  const UserAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final usernameController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Enter the credentials",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 38),

            CredentialsInputField(
              labelTextTitle: 'Enter your Name',
              controller: nameController,
            ),

            SizedBox(height: 18),

            CredentialsInputField(
              labelTextTitle: 'Enter your Username',
              controller: usernameController,
            ),

            SizedBox(height: 28),


            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0)
                ),
                  child: Text("Submit",
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary ),),

                onPressed: () async {
                  final name = nameController.text;
                  final username = usernameController.text;


                  if (name.isNotEmpty && username.isNotEmpty) {
                    final creds = Credentials(name: name, username: username);

                    try {
                      bool isVerified = await ApiService.sendCredentials(creds);
                      if (isVerified) {
                        // If verified, move to Valuation Screen
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) =>
                              CoinValuationScreen(username: username,)),
                        );
                      }
                    }
                    catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('User not found/ invalid credentials'),

                          behavior: SnackBarBehavior.floating,
                        ),
                      );

                    }
                  }
                }

              ),
            ),
          ],
        ),
      ),
    );
  }
}
