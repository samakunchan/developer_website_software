import 'package:fluent_ui/fluent_ui.dart';

class FluentSettingsSoftDivider extends StatelessWidget {
  const FluentSettingsSoftDivider({this.height = 1, this.color, super.key});
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    return Container(
      height: height,
      color: color ?? theme.resources.dividerStrokeColorDefault
    );
  }
}
