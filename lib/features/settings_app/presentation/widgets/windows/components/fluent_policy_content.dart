import 'package:fluent_ui/fluent_ui.dart';

class FluentPolicyContent extends StatelessWidget {
  const FluentPolicyContent({required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return Column(
      crossAxisAlignment: .start,
      spacing: 16,
      children: [
        Text(title, style: theme.typography.subtitle?.copyWith(fontWeight: .bold)),
        Text('Last updated: June 2026', style: theme.typography.caption),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(child: Text(description, style: const TextStyle(fontSize: 14, height: 1.5))),
        ),
      ],
    );
  }
}
