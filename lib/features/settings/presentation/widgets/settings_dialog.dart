import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings/presentation/signals/settings_signals.dart';
import 'package:developer_website_software/features/settings/presentation/widgets/account_tab.dart';
import 'package:developer_website_software/features/settings/presentation/widgets/general_tab.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class SettingsDialog extends StatefulWidget {
  const SettingsDialog({super.key});

  @override
  State<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends State<SettingsDialog> {
  int _activeTab = 0; // 0 for General, 1 for Account Info

  @override
  Widget build(BuildContext context) {
    final SettingsSignals settings = kGetIt<SettingsSignals>();
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Center(
      child: CupertinoPopupSurface(
        child: Container(
          width: 450,
          height: 380,
          padding: const EdgeInsets.all(20),
          color: isDark ? kCardDarkBgColor : CupertinoColors.systemBackground,
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 18,
            children: [
              /// Header with Title and Close button
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Preferences',
                    style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 18, fontWeight: .bold),
                  ),
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    child: const Icon(CupertinoIcons.xmark_circle_fill, color: CupertinoColors.systemGrey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),

              /// Tabs Selector
              CupertinoSlidingSegmentedControl<int>(
                groupValue: _activeTab,
                children: const {
                  0: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 6,
                      children: [
                        Icon(CupertinoIcons.gear_alt, size: 16),
                        Text('General'),
                      ],
                    ),
                  ),
                  1: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 6,
                      children: [
                        Icon(CupertinoIcons.person_crop_circle, size: 16),
                        Text('Account Info'),
                      ],
                    ),
                  ),
                },
                onValueChanged: (int? val) {
                  if (val != null) {
                    setState(() {
                      _activeTab = val;
                    });
                  }
                },
              ),

              /// Active Tab Body
              Expanded(
                child: SignalBuilder(
                  builder: (BuildContext context) {
                    if (_activeTab == 0) {
                      return GeneralTab(settings: settings);
                    } else {
                      return AccountTab(authSignals: authSignals);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
