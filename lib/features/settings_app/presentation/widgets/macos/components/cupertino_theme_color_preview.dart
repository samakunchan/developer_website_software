import 'package:flutter/cupertino.dart';

class CupertinoThemeColorPreview extends StatelessWidget {
  const CupertinoThemeColorPreview({required this.primaryColor, required this.secondaryColor, super.key});

  final Color primaryColor;
  final Color secondaryColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const .only(topLeft: .circular(8), bottomLeft: .circular(8)),
              ),
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
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const .only(topRight: .circular(8), bottomRight: .circular(8)),
              ),
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
