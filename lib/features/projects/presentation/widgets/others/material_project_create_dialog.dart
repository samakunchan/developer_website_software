import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/enums/enums.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialProjectCreateDialog extends StatefulWidget {
  const MaterialProjectCreateDialog({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  State<MaterialProjectCreateDialog> createState() => _MaterialProjectCreateDialogState();
}

class _MaterialProjectCreateDialogState extends State<MaterialProjectCreateDialog> {
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

  Widget _buildStep1(ThemeData theme) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 16,
      children: [
        TextFormField(
          controller: _controller.titleController,
          decoration: const InputDecoration(labelText: 'Title *', border: OutlineInputBorder())
        ),
        TextFormField(
          controller: _controller.slugController,
          readOnly: true,
          enabled: false,
          decoration: const InputDecoration(labelText: 'Slug (auto-generated)', border: OutlineInputBorder())
        ),
        TextFormField(
          controller: _controller.descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(labelText: 'Description', border: OutlineInputBorder())
        ),
        Row(
          spacing: 16,
          children: [
            Expanded(
              child: DropdownButtonFormField<String>(
                initialValue: _controller.category.value,
                decoration: const InputDecoration(labelText: 'Category', border: OutlineInputBorder()),
                items: CategoryDisplay.values.map((CategoryDisplay cat) {
                  return DropdownMenuItem<String>(value: cat.key, child: Text(cat.value));
                }).toList(),
                onChanged: (String? val) {
                  if (val != null) _controller.category.value = val;
                }
              )
            ),
            Expanded(
              child: TextFormField(
                controller: _controller.categoryLabelController,
                decoration: const InputDecoration(labelText: 'Category Label', border: OutlineInputBorder())
              )
            )
          ]
        )
      ]
    );
  }

  Widget _buildStep2(ThemeData theme) {
    final List<TechStackItem> techList = _controller.techStack.value;
    final List<ProjectFeatureItem> featList = _controller.features.value;

    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 16,
      children: [
        TextFormField(
          controller: _controller.caseStudyNumberController,
          decoration: const InputDecoration(labelText: 'Case Study Number (e.g. 01)', border: OutlineInputBorder())
        ),
        const Divider(),
        Text('Tech Stack', style: theme.textTheme.titleMedium?.copyWith(fontWeight: .bold)),
        if (techList.isNotEmpty)
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(techList.length, (int index) {
              final TechStackItem item = techList[index];
              return Chip(
                avatar: const Icon(Icons.code, size: 16),
                label: Text('${item.name} (${item.icon})'),
                onDeleted: () => _controller.removeTechStackItem(index)
              );
            })
          ),
        Row(
          spacing: 8,
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller.newTechNameController,
                decoration: const InputDecoration(labelText: 'Tech Name (e.g. React)', border: OutlineInputBorder())
              )
            ),
            Expanded(
              child: TextFormField(
                controller: _controller.newTechIconController,
                decoration: const InputDecoration(labelText: 'Tech Icon (e.g. logos:react)', border: OutlineInputBorder())
              )
            ),
            IconButton.filledTonal(onPressed: _controller.addTechStackItem, icon: const Icon(Icons.add))
          ]
        ),
        const Divider(),
        Text('Key Features', style: theme.textTheme.titleMedium?.copyWith(fontWeight: .bold)),
        if (featList.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featList.length,
            itemBuilder: (BuildContext context, int index) {
              final ProjectFeatureItem item = featList[index];
              return Card(
                margin: const .only(bottom: 8),
                child: ListTile(
                  leading: const Icon(Icons.star),
                  title: Text(item.title),
                  subtitle: Text(item.description),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _controller.removeFeatureItem(index)
                  )
                )
              );
            }
          ),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: theme.dividerColor),
            borderRadius: .circular(8)
          ),
          child: Padding(
            padding: const .all(12),
            child: Column(
              spacing: 8,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _controller.newFeatureTitleController,
                        decoration: const InputDecoration(labelText: 'Feature Title', border: OutlineInputBorder())
                      )
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: _controller.newFeatureIconController,
                        decoration: const InputDecoration(labelText: 'Feature Icon', border: OutlineInputBorder())
                      )
                    )
                  ]
                ),
                TextFormField(
                  controller: _controller.newFeatureDescController,
                  maxLines: 2,
                  decoration: const InputDecoration(labelText: 'Feature Description', border: OutlineInputBorder())
                ),
                Align(
                  alignment: .centerRight,
                  child: ElevatedButton.icon(
                    onPressed: _controller.addFeatureItem,
                    icon: const Icon(Icons.add),
                    label: const Text('Add Feature')
                  )
                )
              ]
            )
          )
        )
      ]
    );
  }

  Widget _buildStep3(ThemeData theme) {
    return Column(
      crossAxisAlignment: .start,
      mainAxisSize: .min,
      spacing: 16,
      children: [
        DropdownButtonFormField<String>(
          initialValue: _controller.status.value,
          decoration: const InputDecoration(labelText: 'Status', border: OutlineInputBorder()),
          items: StatusDisplay.values.map((StatusDisplay st) {
            return DropdownMenuItem<String>(value: st.key, child: Text(st.value));
          }).toList(),
          onChanged: (String? val) {
            if (val != null) _controller.status.value = val;
          }
        ),
        SwitchListTile(
          title: const Text('Featured Project'),
          subtitle: const Text('Check to showcase this project prominently'),
          value: _controller.isFeatured.value,
          onChanged: (bool val) => _controller.isFeatured.value = val
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SignalBuilder(
      builder: (BuildContext context) {
        final int activeStep = _controller.activeStep.value;
        final bool isLoading = _controller.isLoading.value;
        final String? errorMessage = _controller.errorMessage.value;
        final bool canGoNext = _controller.canGoNext.value;

        return AlertDialog(
          scrollable: true,
          title: const Text('Create New Project'),
          content: SizedBox(
            width: 600,
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
                    defaultLineColor: theme.dividerColor,
                    finishedLineColor: theme.colorScheme.primary
                  ),
                  activeStepTextColor: theme.colorScheme.primary,
                  finishedStepTextColor: theme.colorScheme.onSurface,
                  steps: const [
                    EasyStep(icon: Icon(Icons.info_outline), title: 'Identity'),
                    EasyStep(icon: Icon(Icons.list_alt), title: 'Details'),
                    EasyStep(icon: Icon(Icons.publish), title: 'Status & Settings')
                  ]
                ),
                if (errorMessage != null)
                  Padding(
                    padding: const .only(bottom: 12),
                    child: Text(
                      errorMessage,
                      style: TextStyle(color: theme.colorScheme.error, fontWeight: .bold)
                    )
                  ),
                if (activeStep == 0) _buildStep1(theme),
                if (activeStep == 1) _buildStep2(theme),
                if (activeStep == 2) _buildStep3(theme)
              ]
            )
          ),
          actions: [
            TextButton(
              onPressed: isLoading ? null : () => Navigator.pop(context),
              child: const Text('Cancel')
            ),
            if (activeStep > 0)
              TextButton(
                onPressed: isLoading ? null : _controller.onBackStep,
                child: const Text('Back')
              ),
            ElevatedButton(
              onPressed: canGoNext
                  ? () async {
                      final bool shouldPop = await _controller.onNextStep();
                      if (shouldPop && context.mounted) Navigator.pop(context);
                    }
                  : null,
              child: isLoading
                  ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(activeStep == 2 ? 'Complete & Save' : 'Save & Next')
            )
          ]
        );
      }
    );
  }
}
