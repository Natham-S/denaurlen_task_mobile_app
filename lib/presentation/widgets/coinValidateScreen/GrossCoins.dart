import 'package:flutter/material.dart';

import '../../../utils/AppStrings.dart';

class GrossCoins extends StatelessWidget{
  final int grossCoins;

  const GrossCoins({Key? key, required this.grossCoins}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Image.asset('assets/icons/coins.png'),
            const SizedBox(width: 4),
            Text(
              grossCoins.toString(),
              style: theme.textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
        Text(
          GROSS_COINS,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
      ],
    );
  }
}