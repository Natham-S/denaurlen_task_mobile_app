import 'package:flutter/material.dart';


class PostUserInfo extends StatelessWidget{
  final String username;

  const PostUserInfo({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/images/user-profile.jpg"),
        ),
        const SizedBox(width: 6),


        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: theme.textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              "6 June 2021, 12:10 pm",
              style: theme.textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }

}