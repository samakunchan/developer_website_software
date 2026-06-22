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

    /// Pre-fetch theme when themes tab is selected and screen is active
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
          key: ValueKey<String>('legal-mentions'),
          policyType: 'legal-mentions',
          defaultTitle: 'Mentions légales',
          sidebarTitle: 'Mentions légales',
        );
      case 2:
        return const CupertinoPolicyContent(
          key: ValueKey<String>('cgu'),
          policyType: 'cgu',
          defaultTitle: "Conditions Générales d'Utilisation (CGU)",
          sidebarTitle: "Conditions Générales d'Utilisation (CGU)",
        );
      case 3:
        return const CupertinoPolicyContent(
          key: ValueKey<String>('privacy-policy'),
          policyType: 'privacy-policy',
          defaultTitle: 'Privacy Policy',
          sidebarTitle: 'Privacy Policy',
        );
      case 4:
        return const CupertinoPolicyContent(
          key: ValueKey<String>('cookie-policy'),
          policyType: 'cookie-policy',
          defaultTitle: 'Politique des cookies',
          sidebarTitle: 'Politique des cookies',
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
