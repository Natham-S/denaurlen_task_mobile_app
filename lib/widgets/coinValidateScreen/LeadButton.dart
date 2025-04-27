import 'package:flutter/material.dart';


class LeadButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const LeadButton({
    Key? key,
    required this.isLoading,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12),
      ),
      child: isLoading
          ? const SizedBox(
        width: 20, height: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
      )
          : Row(
        children: [
          Text(
            "Lead + 100",
            style: theme.textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          const SizedBox(width: 8),
          Image.asset('assets/icons/lead-coin.png'),
        ],
      ),
    );
  }
}
