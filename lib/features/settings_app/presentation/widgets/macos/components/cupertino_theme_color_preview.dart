import 'package:flutter/cupertino.dart';

class CupertinoThemeColorPreview extends StatelessWidget {
  const CupertinoThemeColorPreview({required this.primaryColor, required this.secondaryColor, super.key});

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(borderRadius: .vertical(top: .circular(11))),
      child: Row(
        children: [
          Expanded(
            child: ColoredBox(
              color: primaryColor,
              child: Center(
                child: Text(
                  'Primary',
                  style: TextStyle(
                    color: primaryColor.computeLuminance() > 0.5 ? CupertinoColors.black : CupertinoColors.white,
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
                    color: secondaryColor.computeLuminance() > 0.5 ? CupertinoColors.black : CupertinoColors.white,
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
