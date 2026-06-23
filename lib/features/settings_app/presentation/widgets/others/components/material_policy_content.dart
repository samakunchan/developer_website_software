import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialPolicyContent extends StatelessWidget {
  const MaterialPolicyContent({required this.policyType, required this.defaultTitle, required this.sidebarTitle, super.key});

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

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(sidebarTitle, style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                Row(
                  mainAxisSize: .min,
                  spacing: 8,
                  children: [
                    if (saveStatus != PolicySaveStatus.saving) PolicySaveStatusIndicator(status: saveStatus),
                    TextButton(
                      onPressed: isLoading ? null : () => unawaited(signals.savePolicyChanges(policyType)),
                      child: isLoading
                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('Save Changes'),
                    ),
                  ],
                ),
              ],
            ),
            if (error != null)
              Padding(
                padding: const .only(bottom: 16),
                child: Text(error, style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Enter document title...',
                    contentPadding: .symmetric(horizontal: 12, vertical: 10),
                    border: OutlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Expanded(
              child: fleatherController == null
                  ? const Center(child: CircularProgressIndicator(strokeWidth: 2))
                  : Container(
                      padding: const .all(8),
                      decoration: BoxDecoration(
                        border: .all(color: Theme.of(context).dividerColor),
                        borderRadius: .circular(8),
                      ),
                      child: Column(
                        spacing: 8,
                        children: [
                          FleatherToolbar.basic(controller: fleatherController),
                          Expanded(
                            child: FleatherEditor(
                              controller: fleatherController,
                              focusNode: focusNode,
                              padding: const .all(8),
                            ),
                          ),
                        ],
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
        return const Icon(Icons.check_circle, color: Colors.green, size: 20);
      case PolicySaveStatus.modified:
        return const Icon(Icons.circle, color: Colors.orange, size: 12);
      case PolicySaveStatus.error:
        return const Icon(Icons.error, color: Colors.red, size: 20);
      case PolicySaveStatus.saving:
        return const SizedBox.shrink();
    }
  }
}
