import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_account_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_general_tab.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

const double kVertical = 10;
const double kHorizontal = 8;
const double kPadding = 4;

class CupertinoSettingsSoftDialog extends StatefulWidget {
  const CupertinoSettingsSoftDialog({super.key});

  @override
  State<CupertinoSettingsSoftDialog> createState() => _CupertinoSettingsSoftDialogState();
}

class _CupertinoSettingsSoftDialogState extends State<CupertinoSettingsSoftDialog> {
  int _activeTab = 0; // 0 for General, 1 for Account Info

  @override
  Widget build(BuildContext context) {
    final SettingsSoftSignals settings = kGetIt<SettingsSoftSignals>();
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return Center(
      child: CupertinoPopupSurface(
        child: Container(
          width: 500,
          height: 380,
          padding: const .all(20),
          color: isDark ? kCardDarkBgColor : CupertinoColors.systemBackground,
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 18,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    context.localizations.preferencesTitle,
                    style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  CupertinoButton(
                    padding: .zero,
                    minimumSize: .zero,
                    child: const Icon(CupertinoIcons.xmark_circle_fill, color: CupertinoColors.systemGrey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              CupertinoSlidingSegmentedControl<int>(
                groupValue: _activeTab,
                padding: const .all(kPadding),
                children: {
                  0: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 6,
                      children: [const Icon(CupertinoIcons.gear_alt, size: 16), Text(context.localizations.generalTab)]
                    )
                  ),
                  1: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Row(
                      mainAxisSize: .min,
                      spacing: 6,
                      children: [const Icon(CupertinoIcons.person_crop_circle, size: 16), Text(context.localizations.accountInfoTab)]
                    )
                  )
                },
                onValueChanged: (int? val) {
                  if (val != null) {
                    setState(() {
                      _activeTab = val;
                    });
                  }
                },
              ),
              Expanded(
                child: SignalBuilder(
                  builder: (BuildContext context) {
                    if (_activeTab == 0) {
                      return CupertinoGeneralTab(settings: settings);
                    } else {
                      return CupertinoAccountTab(authSignals: authSignals);
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
