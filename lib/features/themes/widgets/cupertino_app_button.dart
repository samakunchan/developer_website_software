import 'package:developer_website_software/features/themes/presentation/buttons_theme.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:flutter/cupertino.dart';

class CupertinoAppButton extends StatelessWidget {
  const CupertinoAppButton({required this.textButton, this.onPressed, super.key});
  final void Function()? onPressed;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;
    return CupertinoButton(
      color: kPrimaryColor,
      foregroundColor: isDark ? DarkThemeConstants.background : kButtonSecondaryColor,
      borderRadius: .circular(kButtonBorderRadius),
      onPressed: onPressed,
      child: Text(textButton),
    );
  }
}
