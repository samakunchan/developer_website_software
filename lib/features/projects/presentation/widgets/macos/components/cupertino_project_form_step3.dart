import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_labeled_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectFormStep3 extends StatelessWidget {
  const CupertinoProjectFormStep3({
    required this.status,
    required this.isFeatured,
    required this.onSelectStatus,
    super.key
  });

  final Signal<String> status;
  final Signal<bool> isFeatured;
  final VoidCallback onSelectStatus;

  @override
  Widget build(BuildContext context) {
    return CupertinoFormSection.insetGrouped(
      header: const Text('STATUS & SETTINGS'),
      children: [
        CupertinoLabeledFormRow(
          label: 'Status',
          child: CupertinoButton(
            padding: .zero,
            alignment: .centerLeft,
            onPressed: onSelectStatus,
            child: SignalBuilder(builder: (_) => Text(ProjectController.statusDisplay(status.value))),
          ),
        ),
        CupertinoLabeledFormRow(
          label: 'Featured',
          child: SignalBuilder(
            builder: (BuildContext context) => CupertinoSwitch(
              value: isFeatured.value,
              onChanged: (bool val) => isFeatured.value = val,
            ),
          ),
        ),
      ],
    );
  }
}
