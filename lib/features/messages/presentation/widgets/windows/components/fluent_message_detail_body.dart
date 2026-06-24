import 'package:developer_website_software/features/messages/presentation/viewmodels/message_view_model.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_metadata_tags.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_project_brief.dart';
import 'package:developer_website_software/features/messages/presentation/widgets/windows/components/fluent_message_sender_profile_card.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentMessageDetailBody extends StatelessWidget {
  const FluentMessageDetailBody({required this.selected, super.key});

  final MessageViewModel selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const .all(24),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            FluentMessageSenderProfileCard(selected: selected),
            const SizedBox(height: 16),
            FluentMessageMetadataTags(selected: selected),
            const SizedBox(height: 24),
            FluentMessageProjectBrief(selected: selected),
          ],
        ),
      ),
    );
  }
}
