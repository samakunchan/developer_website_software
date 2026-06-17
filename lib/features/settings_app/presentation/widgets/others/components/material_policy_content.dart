import 'package:flutter/material.dart';

class MaterialPolicyContent extends StatelessWidget {
  const MaterialPolicyContent({required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Column(
      crossAxisAlignment: .start,
      spacing: 16,
      children: [
        Text(title, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: .bold)),
        Text('Last updated: June 2026', style: theme.textTheme.bodySmall),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(child: Text(description, style: const TextStyle(fontSize: 16, height: 1.5))),
        ),
      ],
    );
  }
}
