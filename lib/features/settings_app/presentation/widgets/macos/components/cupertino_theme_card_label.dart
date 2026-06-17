import 'package:flutter/cupertino.dart';

class CupertinoThemeCardLabel extends StatelessWidget {
  const CupertinoThemeCardLabel({required this.name, required this.isActive, super.key});

  final String name;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .symmetric(horizontal: 10, vertical: 8),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(
              name,
              style: CupertinoTheme.of(
                context,
              ).textTheme.textStyle.copyWith(fontSize: 12, fontWeight: isActive ? .bold : .normal),
              maxLines: 1,
              overflow: .ellipsis,
            ),
          ),
          if (isActive) Icon(CupertinoIcons.checkmark_circle_fill, color: CupertinoTheme.of(context).primaryColor, size: 14),
        ],
      ),
    );
  }
}
