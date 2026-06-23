import 'package:flutter/material.dart';

class MaterialSettingsSoftDivider extends StatelessWidget {
  const MaterialSettingsSoftDivider({this.height = 1, this.color, super.key});
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: height,
      color: color
    );
  }
}
