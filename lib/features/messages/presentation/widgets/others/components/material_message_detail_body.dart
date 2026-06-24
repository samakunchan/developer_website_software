import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/others/components/material_message_metadata_tags.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/others/components/material_message_project_brief.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/others/components/material_message_sender_profile_card.dart';
import 'package:flutter/material.dart';

class MaterialMessageDetailBody extends StatelessWidget {
  const MaterialMessageDetailBody({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const .all(24),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            MaterialMessageSenderProfileCard(selected: selected),
            const SizedBox(height: 16),
            MaterialMessageMetadataTags(selected: selected),
            const SizedBox(height: 24),
            MaterialMessageProjectBrief(selected: selected)
          ]
        )
      )
    );
  }
}
