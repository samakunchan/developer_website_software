import 'package:developer_website_software/features/projects/presentation/controllers/project_controller.dart';
import 'package:developer_website_software/features/projects/presentation/signals/projects_signals.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step1.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step2.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/components/cupertino_project_form_step3.dart';
import 'package:developer_website_software/features/projects/presentation/widgets/macos/utils/cupertino_pickers.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoProjectCreateDialog extends StatefulWidget {
  const CupertinoProjectCreateDialog({required this.signals, super.key});

  final ProjectsSignals signals;

  @override
  State<CupertinoProjectCreateDialog> createState() => _CupertinoProjectCreateDialogState();
}

class _CupertinoProjectCreateDialogState extends State<CupertinoProjectCreateDialog> {
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

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = CupertinoTheme.brightnessOf(context);
    final bool isDark = brightness == .dark;
    final Color bgColor = isDark ? CupertinoColors.systemBackground.darkColor : CupertinoColors.systemBackground;

    return SignalBuilder(
      builder: (BuildContext context) {
        final int activeStep = _controller.activeStep.value;
        final bool isLoading = _controller.isLoading.value;
        final String? errorMessage = _controller.errorMessage.value;
        final bool canGoNext = _controller.canGoNext.value;

        return Center(
          child: Container(
            width: 800,
            height: 700,
            margin: const .symmetric(horizontal: 40, vertical: 20),
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
                middle: const Text('Create New Project'),
                leading: CupertinoButton(
                  padding: .zero,
                  onPressed: isLoading ? null : () => Navigator.pop(context),
                  child: const Text('Cancel'),
                ),
                trailing: Row(
                  mainAxisSize: .min,
                  children: [
                    if (activeStep > 0)
                      CupertinoButton(
                        padding: const .only(right: 8),
                        onPressed: isLoading ? null : _controller.onBackStep,
                        child: const Text('Back'),
                      ),
                    if (isLoading)
                      const CupertinoActivityIndicator(radius: 8)
                    else
                      CupertinoButton(
                        padding: .zero,
                        onPressed: canGoNext
                            ? () async {
                                final bool shouldPop = await _controller.onNextStep();
                                if (shouldPop && context.mounted) Navigator.pop(context);
                              }
                            : null,
                        child: Text(activeStep == 2 ? 'Save' : 'Next', style: const TextStyle(fontWeight: .bold)),
                      ),
                  ],
                ),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const .only(bottom: 24),
                  child: Column(
                    children: [
                      Padding(
                        padding: const .all(16),
                        child: Material(
                          color: CupertinoColors.transparent,
                          child: EasyStepper(
                            activeStep: activeStep,
                            lineStyle: const LineStyle(
                              lineLength: 70,
                              lineType: .normal,
                              defaultLineColor: CupertinoColors.separator,
                              finishedLineColor: CupertinoColors.activeBlue,
                            ),
                            activeStepTextColor: CupertinoColors.activeBlue,
                            finishedStepTextColor: CupertinoColors.label,
                            steps: const [
                              EasyStep(icon: Icon(CupertinoIcons.info), title: 'Identity'),
                              EasyStep(icon: Icon(CupertinoIcons.list_bullet), title: 'Details'),
                              EasyStep(icon: Icon(CupertinoIcons.cloud_upload), title: 'Status'),
                            ],
                          ),
                        ),
                      ),
                      if (errorMessage != null)
                        Padding(
                          padding: const .all(16),
                          child: Text(errorMessage, style: const TextStyle(color: CupertinoColors.destructiveRed, fontSize: 13)),
                        ),
                      if (activeStep == 0)
                        CupertinoProjectFormStep1(
                          titleController: _controller.titleController,
                          slugController: _controller.slugController,
                          descriptionController: _controller.descriptionController,
                          categoryLabelController: _controller.categoryLabelController,
                          category: _controller.category,
                          onSelectCategory: () =>
                              showCupertinoCategoryPicker(context: context, categorySignal: _controller.category),
                        ),
                      if (activeStep == 1)
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
                      if (activeStep == 2)
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
