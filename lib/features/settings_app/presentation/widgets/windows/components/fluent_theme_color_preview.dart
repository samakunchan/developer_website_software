import 'package:fluent_ui/fluent_ui.dart';

class FluentThemeColorPreview extends StatelessWidget {
  const FluentThemeColorPreview({required this.primaryColor, required this.secondaryColor, super.key});

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: primaryColor,
              child: Center(
                child: Text(
                  'Primary',
                  style: TextStyle(
                    color: primaryColor.computeLuminance() > 0.5 ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
                    fontSize: 10,
                    fontWeight: .bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ColoredBox(
              color: secondaryColor,
              child: Center(
                child: Text(
                  'Secondary',
                  style: TextStyle(
                    color: secondaryColor.computeLuminance() > 0.5 ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
                    fontSize: 10,
                    fontWeight: .bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
