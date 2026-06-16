import 'package:flutter/cupertino.dart';

class SettingRow extends StatelessWidget {
  const SettingRow({required this.label, required this.child, super.key});

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(label, style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: .w500)),
        child
      ]
    );
  }
}
