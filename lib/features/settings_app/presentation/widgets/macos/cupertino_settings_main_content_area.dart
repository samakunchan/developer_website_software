import 'dart:async';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_policy_content.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_content.dart';
import 'package:flutter/cupertino.dart';

class CupertinoSettingsMainContentArea extends StatefulWidget {
  const CupertinoSettingsMainContentArea({required this.selectedSectionIndex, this.isActive = false, super.key});

  final int selectedSectionIndex;
  final bool isActive;

  @override
  State<CupertinoSettingsMainContentArea> createState() => _CupertinoSettingsMainContentAreaState();
}

class _CupertinoSettingsMainContentAreaState extends State<CupertinoSettingsMainContentArea> {
  late final SettingsAppSignals _signals;

  @override
  void initState() {
    super.initState();
    _signals = kGetIt<SettingsAppSignals>();
    // Pre-fetch theme when themes tab is selected and screen is active
    if (widget.isActive && widget.selectedSectionIndex == 0) {
      unawaited(_signals.fetchTheme());
    }
  }

  @override
  void didUpdateWidget(CupertinoSettingsMainContentArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    final bool becameActive = widget.isActive && !oldWidget.isActive;
    final bool sectionChangedToThemes = widget.selectedSectionIndex == 0 && oldWidget.selectedSectionIndex != 0;

    if ((becameActive && widget.selectedSectionIndex == 0) || (widget.isActive && sectionChangedToThemes)) {
      unawaited(_signals.fetchTheme());
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildContent(context);
  }

  Widget _buildContent(BuildContext context) {
    switch (widget.selectedSectionIndex) {
      case 0:
        return CupertinoThemeContent(signals: _signals);
      case 1:
        return const CupertinoPolicyContent(
          title: 'Legal Mentions',
          description: 'Legal Mentions outline the ownership, hosting, and contact details of our platform. Under local laws, we specify the publishing entity (PapangueSoft), registered address, hosting provider, and intellectual property rights details here.'
        );
      case 2:
        return const CupertinoPolicyContent(
          title: "Conditions Générales d'Utilisation (CGU)",
          description: 'The CGU governs the access and usage terms of this developer website software. By using the system, users agree to comply with standards of acceptable conduct, intellectual property protection, account security responsibilities, and liability limitations.'
        );
      case 3:
        return const CupertinoPolicyContent(
          title: 'Privacy Policy',
          description: 'The Privacy Policy details how we collect, process, store, and secure user data. We only gather essential metrics required to run developer features. We respect personal data rights under GDPR and CCPA, providing settings to export or erase history.'
        );
      case 4:
        return const CupertinoPolicyContent(
          title: 'Cookie Policy',
          description: 'The Cookie Policy details how we utilize cookies and local storage tokens to persist user preferences (such as light/dark mode selection and session authorization). We only use functional and performance-essential cookies.'
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
