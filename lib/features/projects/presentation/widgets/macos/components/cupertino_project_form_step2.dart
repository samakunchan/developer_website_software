import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_labeled_fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons;
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectFormStep2 extends StatelessWidget {
  const CupertinoProjectFormStep2({
    required this.caseStudyNumberController,
    required this.techStack,
    required this.features,
    required this.newTechNameController,
    required this.newTechIconController,
    required this.newFeatureIconController,
    required this.newFeatureTitleController,
    required this.newFeatureDescController,
    required this.onAddTechStackItem,
    required this.onRemoveTechStackItem,
    required this.onAddFeatureItem,
    required this.onRemoveFeatureItem,
    super.key
  });

  final TextEditingController caseStudyNumberController;
  final Signal<List<TechStackItem>> techStack;
  final Signal<List<ProjectFeatureItem>> features;

  final TextEditingController newTechNameController;
  final TextEditingController newTechIconController;

  final TextEditingController newFeatureIconController;
  final TextEditingController newFeatureTitleController;
  final TextEditingController newFeatureDescController;

  final VoidCallback onAddTechStackItem;
  final ValueChanged<int> onRemoveTechStackItem;
  final VoidCallback onAddFeatureItem;
  final ValueChanged<int> onRemoveFeatureItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoFormSection.insetGrouped(
          header: const Text('DETAILS'),
          children: [
            CupertinoLabeledTextFormFieldRow(
              controller: caseStudyNumberController,
              label: 'Case Study #',
              placeholder: 'Enter case study number',
            ),
          ],
        ),
        CupertinoFormSection.insetGrouped(
          header: const Text('TECH STACK'),
          children: [
            SignalBuilder(
              builder: (BuildContext context) {
                final List<TechStackItem> techList = techStack.value;
                if (techList.isEmpty) return const SizedBox.shrink();
                return Padding(
                  padding: const .all(12),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(techList.length, (int index) {
                      final TechStackItem item = techList[index];

                      return Container(
                        padding: const .symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: CupertinoColors.systemGroupedBackground, borderRadius: .circular(16)),
                        child: Row(
                          mainAxisSize: .min,
                          spacing: 4,
                          children: [
                            const Icon(Icons.code, size: 14),
                            Text('${item.name} (${item.icon})', style: const TextStyle(fontSize: 12)),
                            CupertinoButton(
                              padding: .zero,
                              minimumSize: .zero,
                              onPressed: () => onRemoveTechStackItem(index),
                              child: const Icon(CupertinoIcons.clear_circled_solid, size: 14, color: CupertinoColors.systemRed),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                );
              },
            ),
            CupertinoLabeledTextFormFieldRow(controller: newTechNameController, label: 'Name', placeholder: 'e.g. React'),
            CupertinoLabeledTextFormFieldRow(controller: newTechIconController, label: 'Icon', placeholder: 'e.g. logos:react'),
            CupertinoFormRow(
              child: Align(
                alignment: .centerRight,
                child: CupertinoButton(onPressed: onAddTechStackItem, child: const Text('Add Tech')),
              ),
            ),
          ],
        ),
        CupertinoFormSection.insetGrouped(
          header: const Text('KEY FEATURES'),
          children: [
            SignalBuilder(
              builder: (BuildContext context) {
                final List<ProjectFeatureItem> featList = features.value;

                if (featList.isEmpty) return const SizedBox.shrink();
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: featList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ProjectFeatureItem item = featList[index];
                    return Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: CupertinoColors.separator, width: 0.5)),
                      ),
                      child: CupertinoFormRow(
                        prefix: Row(
                          spacing: 8,
                          children: [
                            const Icon(Icons.star, size: 16),
                            Text(item.title, style: const TextStyle(fontWeight: .bold)),
                          ],
                        ),
                        helper: Text(item.description),
                        child: CupertinoButton(
                          padding: .zero,
                          onPressed: () => onRemoveFeatureItem(index),
                          child: const Icon(CupertinoIcons.trash, color: CupertinoColors.destructiveRed, size: 18),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CupertinoLabeledTextFormFieldRow(controller: newFeatureTitleController, label: 'Title', placeholder: 'Feature title'),
            CupertinoLabeledTextFormFieldRow(controller: newFeatureIconController, label: 'Icon', placeholder: 'Icon name'),
            CupertinoLabeledTextFormFieldRow(
              controller: newFeatureDescController,
              label: 'Description',
              placeholder: 'Feature description',
            ),
            CupertinoFormRow(
              child: Align(
                alignment: .centerRight,
                child: CupertinoButton(onPressed: onAddFeatureItem, child: const Text('Add Feature')),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
