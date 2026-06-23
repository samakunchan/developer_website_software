import 'dart:async';

import 'package:developer_website_software/features/projects/domain/entities/project_entity.dart';
import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step1.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step2.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step3.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/utils/cupertino_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectEditDialog extends StatefulWidget {
  const CupertinoProjectEditDialog({required this.project, required this.signals, super.key});

  final ProjectEntity project;
  final ProjectsSignals signals;

  @override
  State<CupertinoProjectEditDialog> createState() => _CupertinoProjectEditDialogState();
}

class _CupertinoProjectEditDialogState extends State<CupertinoProjectEditDialog> {
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
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    final bool isDark = brightness == .dark;
    final Color bgColor = isDark ? CupertinoColors.systemBackground.darkColor : CupertinoColors.systemBackground;

    return SignalBuilder(
      builder: (BuildContext context) {
        final bool isLoading = _controller.isLoading.value;
        final String? errorMessage = _controller.errorMessage.value;
        final bool canSave = _canSave.value;

        return Center(
          child: Container(
            width: 800,
            height: 700,
            margin: const .all(40),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: .circular(12),
              boxShadow: [
                BoxShadow(color: CupertinoColors.systemGrey.withValues(alpha: 0.3), blurRadius: 16, offset: const Offset(0, 8)),
              ],
            ),
            child: CupertinoPageScaffold(
              backgroundColor: CupertinoColors.transparent,
              navigationBar: CupertinoNavigationBar(
                middle: const Text('Edit Project'),
                leading: CupertinoButton(
                  padding: .zero,
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                trailing: isLoading
                    ? const CupertinoActivityIndicator(radius: 8)
                    : CupertinoButton(
                        padding: .zero,
                        onPressed: canSave ? _onSave : null,
                        child: const Text('Save', style: TextStyle(fontWeight: .bold)),
                      ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const .only(bottom: 24),
                  child: Column(
                    children: [
                      if (errorMessage != null)
                        Padding(
                          padding: const .all(16),
                          child: Text(errorMessage, style: const TextStyle(color: CupertinoColors.destructiveRed, fontSize: 13)),
                        ),
                      CupertinoProjectFormStep1(
                        titleController: _controller.titleController,
                        slugController: _controller.slugController,
                        descriptionController: _controller.descriptionController,
                        categoryLabelController: _controller.categoryLabelController,
                        category: _controller.category,
                        onSelectCategory: () =>
                            showCupertinoCategoryPicker(context: context, categorySignal: _controller.category),
                      ),
                      CupertinoProjectFormStep2(
                        caseStudyNumberController: _controller.caseStudyNumberController,
                        techStack: _controller.techStack,
                        features: _controller.features,
                        newTechNameController: _controller.newTechNameController,
                        newTechIconController: _controller.newTechIconController,
                        newFeatureIconController: _controller.newFeatureIconController,
                        newFeatureTitleController: _controller.newFeatureTitleController,
                        newFeatureDescController: _controller.newFeatureDescController,
                        onAddTechStackItem: _controller.addTechStackItem,
                        onRemoveTechStackItem: _controller.removeTechStackItem,
                        onAddFeatureItem: _controller.addFeatureItem,
                        onRemoveFeatureItem: _controller.removeFeatureItem,
                      ),
                      CupertinoProjectFormStep3(
                        status: _controller.status,
                        isFeatured: _controller.isFeatured,
                        onSelectStatus: () => showCupertinoStatusPicker(context: context, statusSignal: _controller.status),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
