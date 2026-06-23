import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/enums/enums.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentProjectEditDialog extends StatefulWidget {
  const FluentProjectEditDialog({required this.project, required this.signals, super.key});

  final ProjectEntity project;
  final ProjectsSignals signals;

  @override
  State<FluentProjectEditDialog> createState() => _FluentProjectEditDialogState();
}

class _FluentProjectEditDialogState extends State<FluentProjectEditDialog> {
  late final ProjectController _controller;
  late final Computed<bool> _canSave;

  @override
  void initState() {
    super.initState();
    _controller = ProjectController(widget.signals, project: widget.project)..init();

    _canSave = computed<bool>(() {
      return _controller.titleSignal.value.trim().isNotEmpty && !_controller.isLoading.value;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final bool success = await _controller.saveEditedProject();
    if (success && mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SignalBuilder(
      builder: (BuildContext context) {
        final bool isLoading = _controller.isLoading.value;
        final String? errorMessage = _controller.errorMessage.value;
        final String categoryVal = _controller.category.value;
        final String statusVal = _controller.status.value;
        final bool isFeaturedVal = _controller.isFeatured.value;
        final bool canSave = _canSave.value;
        final List<TechStackItem> techList = _controller.techStack.value;
        final List<ProjectFeatureItem> featList = _controller.features.value;

        return ContentDialog(
          title: const Text('Edit Project'),
          constraints: const BoxConstraints(maxWidth: 600),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              spacing: 12,
              children: [
                if (errorMessage != null)
                  Padding(
                    padding: const .only(bottom: 12),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontWeight: .bold)
                    )
                  ),
                InfoLabel(
                  label: 'Title',
                  child: TextBox(controller: _controller.titleController, placeholder: 'Enter title')
                ),
                InfoLabel(
                  label: 'Slug (auto-generated)',
                  child: TextBox(controller: _controller.slugController, readOnly: true, enabled: false)
                ),
                InfoLabel(
                  label: 'Description',
                  child: TextBox(controller: _controller.descriptionController, placeholder: 'Enter description', maxLines: 3)
                ),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: InfoLabel(
                        label: 'Category',
                        child: ComboBox<String>(
                          value: categoryVal,
                          items: CategoryDisplay.values.map((CategoryDisplay cat) {
                            return ComboBoxItem<String>(value: cat.key, child: Text(cat.value));
                          }).toList(),
                          onChanged: (String? val) {
                            if (val != null) _controller.category.value = val;
                          }
                        )
                      )
                    ),
                    Expanded(
                      child: InfoLabel(
                        label: 'Category Label',
                        child: TextBox(controller: _controller.categoryLabelController, placeholder: 'Enter category label')
                      )
                    )
                  ]
                ),
                InfoLabel(
                  label: 'Case Study Number',
                  child: TextBox(controller: _controller.caseStudyNumberController, placeholder: 'Enter case study number')
                ),
                const Divider(),
                Text('Tech Stack', style: theme.typography.subtitle),
                if (techList.isNotEmpty)
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(techList.length, (int index) {
                      final TechStackItem item = techList[index];
                      return Container(
                        padding: const .symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(
                          color: theme.resources.cardBackgroundFillColorDefault,
                          borderRadius: .circular(16),
                          border: Border.all(color: theme.resources.dividerStrokeColorDefault)
                        ),
                        child: Row(
                          mainAxisSize: .min,
                          children: [
                            const Icon(FluentIcons.code, size: 14),
                            const SizedBox(width: 4),
                            Text('${item.name} (${item.icon})', style: const TextStyle(fontSize: 12)),
                            const SizedBox(width: 4),
                            IconButton(
                              icon: const Icon(FluentIcons.clear, size: 10),
                              onPressed: () => _controller.removeTechStackItem(index)
                            )
                          ]
                        )
                      );
                    })
                  ),
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextBox(controller: _controller.newTechNameController, placeholder: 'Tech Name (e.g. React)')
                    ),
                    Expanded(
                      child: TextBox(controller: _controller.newTechIconController, placeholder: 'Tech Icon (e.g. logos:react)')
                    ),
                    Button(onPressed: _controller.addTechStackItem, child: const Icon(FluentIcons.add))
                  ]
                ),
                const Divider(),
                Text('Key Features', style: theme.typography.subtitle),
                if (featList.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: featList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ProjectFeatureItem item = featList[index];
                      return Container(
                        margin: const .only(bottom: 8),
                        padding: const .all(8),
                        decoration: BoxDecoration(
                          color: theme.resources.cardBackgroundFillColorDefault,
                          borderRadius: .circular(4),
                          border: Border.all(color: theme.resources.dividerStrokeColorDefault)
                        ),
                        child: Row(
                          children: [
                            const Icon(FluentIcons.favorite_star, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(item.title, style: const TextStyle(fontWeight: .bold)),
                                  Text(item.description, style: const TextStyle(fontSize: 12))
                                ]
                              )
                            ),
                            IconButton(
                              icon: Icon(FluentIcons.delete, color: Colors.red),
                              onPressed: () => _controller.removeFeatureItem(index)
                            )
                          ]
                        )
                      );
                    }
                  ),
                Container(
                  padding: const .all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.resources.dividerStrokeColorDefault),
                    borderRadius: .circular(8)
                  ),
                  child: Column(
                    spacing: 8,
                    children: [
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: TextBox(controller: _controller.newFeatureTitleController, placeholder: 'Feature Title')
                          ),
                          Expanded(
                            child: TextBox(controller: _controller.newFeatureIconController, placeholder: 'Feature Icon')
                          )
                        ]
                      ),
                      TextBox(controller: _controller.newFeatureDescController, placeholder: 'Feature Description', maxLines: 2),
                      Align(
                        alignment: .centerRight,
                        child: FilledButton(onPressed: _controller.addFeatureItem, child: const Text('Add Feature'))
                      )
                    ]
                  )
                ),
                const Divider(),
                Row(
                  spacing: 12,
                  children: [
                    Expanded(
                      child: InfoLabel(
                        label: 'Status',
                        child: ComboBox<String>(
                          value: statusVal,
                          items: StatusDisplay.values.map((StatusDisplay st) {
                            return ComboBoxItem<String>(value: st.key, child: Text(st.value));
                          }).toList(),
                          onChanged: (String? val) {
                            if (val != null) _controller.status.value = val;
                          }
                        )
                      )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const .only(top: 18),
                        child: ToggleSwitch(
                          checked: isFeaturedVal,
                          content: const Text('Featured'),
                          onChanged: (bool val) => _controller.isFeatured.value = val
                        )
                      )
                    )
                  ]
                )
              ]
            )
          ),
          actions: [
            Button(
              onPressed: isLoading ? null : () => Navigator.pop(context),
              child: const Text('Cancel')
            ),
            FilledButton(
              onPressed: canSave ? _onSave : null,
              child: isLoading
                  ? const SizedBox(width: 16, height: 16, child: ProgressRing(strokeWidth: 2))
                  : const Text('Save')
            )
          ]
        );
      }
    );
  }
}
