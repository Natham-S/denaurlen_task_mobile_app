import 'package:flutter/material.dart';

import '../../utils/AppStrings.dart';
import '../widgets/authScreen/CredentialsInputField.dart';
import '../widgets/authScreen/CredentialsSubmitBtn.dart';

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
            Text(
              ENTER_CRED,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),

            SizedBox(height: 38),

            CredentialsInputField(
              labelTextTitle: USER_NAME,
              controller: nameController,
            ),

            SizedBox(height: 18),

            CredentialsInputField(
              labelTextTitle: USER_USERNAME,
              controller: usernameController,
            ),

            SizedBox(height: 28),


            CredentialsSubmitBtn(
              nameController: nameController,
              usernameController: usernameController,
            )
          ],
        ),
      ),
    );
  }
}
