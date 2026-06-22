import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:fleather/fleather.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Material;
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoPolicyContent extends StatelessWidget {
  const CupertinoPolicyContent({required this.policyType, required this.defaultTitle, required this.sidebarTitle, super.key});

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
          crossAxisAlignment: .start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  sidebarTitle,
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: .bold),
                ),
                Row(
                  mainAxisSize: .min,
                  spacing: 8,
                  children: [
                    if (saveStatus != .saving) PolicySaveStatusIndicator(status: saveStatus),
                    CupertinoButton(
                      padding: .zero,
                      onPressed: isLoading ? null : () => unawaited(signals.savePolicyChanges(policyType)),
                      child: isLoading ? const CupertinoActivityIndicator() : const Text('Save Changes'),
                    ),
                  ],
                ),
              ],
            ),
            if (error != null)
              Padding(
                padding: const .only(bottom: 16),
                child: Text(error, style: const TextStyle(color: CupertinoColors.destructiveRed)),
              ),
            Column(
              crossAxisAlignment: .start,
              children: [
                CupertinoTextField(
                  controller: titleController,
                  placeholder: 'Enter document title...',
                  padding: const .symmetric(horizontal: 12, vertical: 10),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemBackground.resolveFrom(context),
                    borderRadius: .circular(8),
                    border: .all(color: CupertinoColors.separator.resolveFrom(context)),
                  ),
                  style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontSize: 16, fontWeight: .w500),
                ),
              ],
            ),
            Expanded(
              child: fleatherController == null
                  ? const Center(child: CupertinoActivityIndicator())
                  : Material(
                      color: CupertinoColors.systemBackground.resolveFrom(context),
                      borderRadius: .circular(8),
                      child: Container(
                        padding: const .all(8),
                        decoration: BoxDecoration(
                          border: .all(color: CupertinoColors.separator.resolveFrom(context)),
                          borderRadius: .circular(8),
                        ),
                        child: Column(
                          spacing: 8,
                          children: [
                            FleatherToolbar.basic(controller: fleatherController),
                            Expanded(
                              child: FleatherEditor(controller: fleatherController, focusNode: focusNode, padding: const .all(8)),
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
      case .loaded:
        return const Icon(CupertinoIcons.checkmark_circle_fill, color: CupertinoColors.activeGreen, size: 20);
      case .modified:
        return const Icon(CupertinoIcons.circle_fill, color: CupertinoColors.systemOrange, size: 12);
      case .error:
        return const Icon(CupertinoIcons.exclamationmark_circle_fill, color: CupertinoColors.destructiveRed, size: 20);
      case .saving:
        return const SizedBox.shrink();
    }
  }
}
