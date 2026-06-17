import 'package:fluent_ui/fluent_ui.dart';

class FluentThemeCardLabel extends StatelessWidget {
  const FluentThemeCardLabel({required this.name, required this.isActive, super.key});

  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return Padding(
      padding: const .symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: theme.typography.body?.copyWith(fontSize: 12, fontWeight: isActive ? .bold : .normal),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          if (isActive) Icon(FluentIcons.completed, color: theme.accentColor, size: 14),
        ],
      ),
    );
  }
}
