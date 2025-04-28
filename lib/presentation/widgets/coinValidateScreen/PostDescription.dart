import 'package:flutter/material.dart';

import '../../../ui/CustomTheme.dart';

class PostDescription extends StatelessWidget{

  final String username;

  const PostDescription({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Text(
      "@${username} "
          "If everything seems under control, you're going fast enough. Be Fast, Be Curious..! 😎",
      style: theme.textTheme.bodySmall?.copyWith(
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }

}