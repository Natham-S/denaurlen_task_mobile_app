import 'package:flutter/material.dart';

import '../../screens/UserAuthScreen.dart';

class LogOutBtn extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Logout'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => UserAuthScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}