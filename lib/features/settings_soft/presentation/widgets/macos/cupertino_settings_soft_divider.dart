import 'package:flutter/cupertino.dart';

class CupertinoSettingsSoftDivider extends StatelessWidget {
  const CupertinoSettingsSoftDivider({this.height = 1, this.color, super.key});
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(height: height, color: color ?? CupertinoColors.separator);
  }
}
