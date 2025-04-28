import 'package:flutter/material.dart';

import '../../../utils/AppStrings.dart';

class LeadUserInfo extends StatelessWidget{
  final int netCoins;
  final String leadUser;

  const LeadUserInfo({
    Key? key,
    required this.netCoins,
    required this.leadUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/lead-profile.jpg"),
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset('assets/icons/coins.png'),
                const SizedBox(width: 4),
                Text(
                  netCoins.toString(),
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset('assets/icons/grow.png'),
              ],
            ),
            Row(
              children: [
                Text(
                  leadUser,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Text(
                  IN_LEAD,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
  
}