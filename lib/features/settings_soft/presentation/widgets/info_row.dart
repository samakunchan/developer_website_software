import 'package:flutter/cupertino.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .spaceBetween,
      children: [
        Text(
          label,
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: CupertinoColors.systemGrey, fontSize: 14),
        ),
        Text(value, style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: .w500, fontSize: 14)),
      ],
    );
  }
}
