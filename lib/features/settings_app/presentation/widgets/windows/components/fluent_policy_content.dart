import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:fleather/fleather.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart' show Material;
import 'package:signals_flutter/signals_flutter.dart';

class FluentPolicyContent extends StatelessWidget {
  const FluentPolicyContent({required this.policyType, required this.defaultTitle, required this.sidebarTitle, super.key});

  final String policyType;
  final String defaultTitle;
  final String sidebarTitle;

  @override
  Widget build(BuildContext context) {
    final SettingsAppSignals signals = kGetIt<SettingsAppSignals>();

    final FleatherController? controller = signals.getFleatherControllerSignal(policyType).value;
    final bool isLoadingVal = signals.getPolicyLoadingSignal(policyType).value;
    if (controller == null && !isLoadingVal) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        unawaited(signals.fetchPolicy(policyType, defaultTitle));
      });
    }

    return SignalBuilder(
      builder: (BuildContext context) {
        final bool isLoading = signals.getPolicyLoadingSignal(policyType).value;
        final String? error = signals.getPolicyErrorSignal(policyType).value;
        final FleatherController? fleatherController = signals.getFleatherControllerSignal(policyType).value;
        final TextEditingController titleController = signals.getOrCreateTitleController(policyType, defaultTitle);
        final PolicySaveStatus saveStatus = signals.getPolicySaveStatusSignal(policyType).value;
        final FocusNode focusNode = signals.getOrCreateFocusNode(policyType);
        final FluentThemeData theme = FluentTheme.of(context);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sidebarTitle, style: theme.typography.subtitle?.copyWith(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 8,
                  children: [
                    if (saveStatus != PolicySaveStatus.saving) PolicySaveStatusIndicator(status: saveStatus),
                    Button(
                      onPressed: isLoading ? null : () => unawaited(signals.savePolicyChanges(policyType)),
                      child: isLoading
                          ? const SizedBox(width: 20, height: 20, child: ProgressRing(strokeWidth: 2))
                          : const Text('Save Changes'),
                    ),
                  ],
                ),
              ],
            ),
            if (error != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(error, style: const TextStyle(color: Color(0xFFEF4444))),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextBox(
                  controller: titleController,
                  placeholder: 'Enter document title...',
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
              ],
            ),
            Expanded(
              child: fleatherController == null
                  ? const Center(child: ProgressRing(strokeWidth: 2))
                  : Material(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: theme.resources.dividerStrokeColorDefault),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          spacing: 8,
                          children: [
                            FleatherToolbar.basic(controller: fleatherController),
                            Expanded(
                              child: FleatherEditor(
                                controller: fleatherController,
                                focusNode: focusNode,
                                padding: const EdgeInsets.all(8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ],
        );
      },
    );
  }
}

class PolicySaveStatusIndicator extends StatelessWidget {
  const PolicySaveStatusIndicator({required this.status, super.key});

  final PolicySaveStatus status;

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case PolicySaveStatus.loaded:
        return const Icon(FluentIcons.completed, color: Color(0xFF22C55E), size: 20);
      case PolicySaveStatus.modified:
        return Container(
          width: 12,
          height: 12,
          decoration: const BoxDecoration(color: Color(0xFFF97316), shape: BoxShape.circle),
        );
      case PolicySaveStatus.error:
        return const Icon(FluentIcons.error, color: Color(0xFFEF4444), size: 20);
      case PolicySaveStatus.saving:
        return const SizedBox.shrink();
    }
  }
}
