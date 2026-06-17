import 'package:flutter/material.dart';

class MaterialThemeColorPreview extends StatelessWidget {
  const MaterialThemeColorPreview({required this.primaryColor, required this.secondaryColor, super.key});

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
                    color: primaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
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
                    color: secondaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white,
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
