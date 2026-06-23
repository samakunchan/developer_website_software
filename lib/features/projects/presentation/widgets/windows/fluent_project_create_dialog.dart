import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/enums/enums.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentProjectCreateDialog extends StatefulWidget {
  const FluentProjectCreateDialog({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  State<FluentProjectCreateDialog> createState() => _FluentProjectCreateDialogState();
}

class _FluentProjectCreateDialogState extends State<FluentProjectCreateDialog> {
  late final ProjectController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ProjectController(widget.signals)..init();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 12,
      children: [
        InfoLabel(
          label: 'Title *',
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
                  value: _controller.category.value,
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
        )
      ]
    );
  }

  Widget _buildStep2(FluentThemeData theme) {
    final List<TechStackItem> techList = _controller.techStack.value;
    final List<ProjectFeatureItem> featList = _controller.features.value;

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 12,
      children: [
        InfoLabel(
          label: 'Case Study Number (e.g. 01)',
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
        )
      ]
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 12,
      children: [
        InfoLabel(
          label: 'Status',
          child: ComboBox<String>(
            value: _controller.status.value,
            items: StatusDisplay.values.map((StatusDisplay st) {
              return ComboBoxItem<String>(value: st.key, child: Text(st.value));
            }).toList(),
            onChanged: (String? val) {
              if (val != null) _controller.status.value = val;
            }
          )
        ),
        Padding(
          padding: const .only(top: 18),
          child: ToggleSwitch(
            checked: _controller.isFeatured.value,
            content: const Text('Featured Project'),
            onChanged: (bool val) => _controller.isFeatured.value = val
          )
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return SignalBuilder(
      builder: (BuildContext context) {
        final int activeStep = _controller.activeStep.value;
        final bool isLoading = _controller.isLoading.value;
        final String? errorMessage = _controller.errorMessage.value;
        final bool canGoNext = _controller.canGoNext.value;

        return ContentDialog(
          title: const Text('Create New Project'),
          constraints: const BoxConstraints(maxWidth: 600),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              mainAxisSize: .min,
              spacing: 16,
              children: [
                EasyStepper(
                  activeStep: activeStep,
                  lineStyle: LineStyle(
                    lineLength: 70,
                    lineType: .normal,
                    defaultLineColor: theme.resources.dividerStrokeColorDefault,
                    finishedLineColor: theme.accentColor
                  ),
                  activeStepTextColor: theme.accentColor,
                  finishedStepTextColor: theme.resources.textFillColorPrimary,
                  steps: const [
                    EasyStep(icon: Icon(FluentIcons.info), title: 'Identity'),
                    EasyStep(icon: Icon(FluentIcons.bulleted_list), title: 'Details'),
                    EasyStep(icon: Icon(FluentIcons.publish_course), title: 'Status')
                  ]
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const .only(bottom: 12),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: Colors.red, fontWeight: .bold)
                    )
                  ),
                if (activeStep == 0) _buildStep1(),
                if (activeStep == 1) _buildStep2(theme),
                if (activeStep == 2) _buildStep3()
              ]
            )
          ),
          actions: [
            Button(
              onPressed: isLoading ? null : () => Navigator.pop(context),
              child: const Text('Cancel')
            ),
            if (activeStep > 0)
              Button(
                onPressed: isLoading ? null : _controller.onBackStep,
                child: const Text('Back')
              ),
            FilledButton(
              onPressed: canGoNext
                  ? () async {
                      final bool shouldPop = await _controller.onNextStep();
                      if (shouldPop && context.mounted) Navigator.pop(context);
                    }
                  : null,
              child: isLoading
                  ? const SizedBox(width: 16, height: 16, child: ProgressRing(strokeWidth: 2))
                  : Text(activeStep == 2 ? 'Save' : 'Next')
            )
          ]
        );
      }
    );
  }
}
