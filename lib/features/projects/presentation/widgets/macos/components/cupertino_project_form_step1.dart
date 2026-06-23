import 'package:developer_website_software/core/extensions/string_extension.dart';
import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_labeled_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectFormStep1 extends StatelessWidget {
  const CupertinoProjectFormStep1({
    required this.titleController,
    required this.slugController,
    required this.descriptionController,
    required this.categoryLabelController,
    required this.category,
    required this.onSelectCategory,
    super.key,
  });

  final TextEditingController titleController;
  final TextEditingController slugController;
  final TextEditingController descriptionController;
  final TextEditingController categoryLabelController;
  final Signal<String> category;
  final VoidCallback onSelectCategory;

  @override
  Widget build(BuildContext context) {
    const String title = 'Enter project title';

    return Column(
      children: [
        CupertinoFormSection.insetGrouped(
          header: const Text('PROJECT IDENTITY'),
          children: [
            CupertinoLabeledTextFormFieldRow(controller: titleController, label: 'Title *', placeholder: title),
            CupertinoLabeledTextFormFieldRow(
              controller: slugController,
              label: 'Slug',
              readOnly: true,
              enabled: false,
              style: const TextStyle(color: CupertinoColors.placeholderText),
              placeholder: title.slugify(),
            ),
            CupertinoLabeledTextFormFieldRow(
              controller: descriptionController,
              label: 'Description',
              placeholder: 'Enter project description',
              maxLines: 3,
            ),
          ],
        ),
        CupertinoFormSection.insetGrouped(
          header: const Text('CATEGORIZATION'),
          children: [
            CupertinoLabeledFormRow(
              label: 'Category',
              child: CupertinoButton(
                padding: .zero,
                alignment: .centerLeft,
                onPressed: onSelectCategory,
                child: SignalBuilder(builder: (_) => Text(ProjectController.categoryDisplay(category.value))),
              ),
            ),
            CupertinoLabeledTextFormFieldRow(
              controller: categoryLabelController,
              label: 'Category Label',
              placeholder: 'Enter category label',
            ),
          ],
        ),
      ],
    );
  }
}
