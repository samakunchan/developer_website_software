import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show SelectionArea;

class CupertinoMessageProjectBrief extends StatelessWidget {
  const CupertinoMessageProjectBrief({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Text(
          'PROJECT BRIEF',
          style: TextStyle(
            fontSize: 11,
            fontWeight: .bold,
            color: isDark ? CupertinoColors.systemGrey : CupertinoColors.systemGrey2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          padding: const .all(20),
          decoration: BoxDecoration(
            color: isDark ? CupertinoColors.darkBackgroundGray : CupertinoColors.white,
            borderRadius: .circular(12),
            border: Border.all(color: isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5),
          ),
          child: SelectionArea(
            child: Text(
              selected.projectBrief,
              style: TextStyle(fontSize: 15, height: 1.5, color: isDark ? CupertinoColors.white : CupertinoColors.black),
            ),
          ),
        ),
      ],
    );
  }
}
