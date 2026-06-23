import 'package:fluent_ui/fluent_ui.dart';

class FluentSettingRow extends StatelessWidget {
  const FluentSettingRow({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: theme.resources.textFillColorPrimary
          )
        ),
        child
      ]
    );
  }
}
