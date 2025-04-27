import 'package:flutter/material.dart';

import '../../ui/CustomColorScheme.dart';
import '../../ui/CustomTheme.dart';

class CredentialsInputField extends StatelessWidget {
  final String labelTextTitle;
  final TextEditingController controller;

  const CredentialsInputField({
    super.key,
    required this.labelTextTitle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: theme.textTheme.titleMedium?.copyWith(
        color: customColorScheme.tertiaryFixed
      ),
      decoration: InputDecoration(
        labelText: labelTextTitle,
        labelStyle: theme.textTheme.labelMedium?.copyWith(
          color: Theme.of(context).colorScheme.onTertiary,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 185, 179, 179),
            width: 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 14,
        ),
      ),
    );
  }
}
