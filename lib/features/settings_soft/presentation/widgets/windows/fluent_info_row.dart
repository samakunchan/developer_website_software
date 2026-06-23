import 'package:fluent_ui/fluent_ui.dart';

class FluentInfoRow extends StatelessWidget {
  const FluentInfoRow({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: theme.resources.textFillColorSecondary,
            fontSize: 14
          )
        ),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
          )
        )
      ]
    );
  }
}
