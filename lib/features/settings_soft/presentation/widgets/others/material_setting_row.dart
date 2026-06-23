import 'package:flutter/material.dart';

class MaterialSettingRow extends StatelessWidget {
  const MaterialSettingRow({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: .w500
          )
        ),
        child
      ]
    );
  }
}
