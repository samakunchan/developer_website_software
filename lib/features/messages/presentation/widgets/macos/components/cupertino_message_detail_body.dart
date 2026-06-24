import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_metadata_tags.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_project_brief.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/macos/components/cupertino_message_sender_profile_card.dart';
import 'package:flutter/cupertino.dart';

class CupertinoMessageDetailBody extends StatelessWidget {
  const CupertinoMessageDetailBody({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const .all(24),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            CupertinoMessageSenderProfileCard(selected: selected),
            const SizedBox(height: 16),
            CupertinoMessageMetadataTags(selected: selected),
            const SizedBox(height: 24),
            CupertinoMessageProjectBrief(selected: selected)
          ]
        )
      )
    );
  }
}
