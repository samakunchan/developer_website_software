import 'package:flutter/cupertino.dart';

class CupertinoPolicyContent extends StatelessWidget {
  const CupertinoPolicyContent({required this.title, required this.description, super.key});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 16,
      children: [
        Text(title, style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: .bold)),
        Text(
          'Last updated: June 2026',
          style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: CupertinoColors.secondaryLabel, fontSize: 13),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: SingleChildScrollView(
            child: Text(description, style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16, height: 1.5)),
          ),
        ),
      ],
    );
  }
}
