import 'package:flutter/material.dart';

class MaterialThemeCardLabel extends StatelessWidget {
  const MaterialThemeCardLabel({required this.name, required this.isActive, super.key});

  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const .symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: theme.textTheme.bodyMedium?.copyWith(fontSize: 12, fontWeight: isActive ? .bold : .normal),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          if (isActive) Icon(Icons.check_circle, color: theme.colorScheme.primary, size: 16),
        ],
      ),
    );
  }
}
