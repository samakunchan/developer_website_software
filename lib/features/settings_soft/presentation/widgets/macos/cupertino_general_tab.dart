import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_setting_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_settings_soft_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show ThemeMode;
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoGeneralTab extends StatelessWidget {
  const CupertinoGeneralTab({required this.settings, super.key});
  final SettingsSoftSignals settings;

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (BuildContext context) {
        final ThemeMode currentTheme = settings.themeMode.value;
        final AppFontSize currentSize = settings.fontSize.value;
        final AppFontFamily currentFont = settings.fontFamily.value;
        final String currentLocale = settings.localeCode.value;

        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            CupertinoSettingRow(
              label: context.localizations.appearanceLabel,
              child: CupertinoSlidingSegmentedControl<ThemeMode>(
                groupValue: currentTheme,
                padding: const .all(4),
                children: {
                  ThemeMode.system: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.themeSystem)
                  ),
                  ThemeMode.light: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.themeLight)
                  ),
                  ThemeMode.dark: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.themeDark)
                  )
                },
                onValueChanged: (ThemeMode? val) {
                  if (val != null) {
                    settings.setThemeMode(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),
            CupertinoSettingRow(
              label: context.localizations.fontSizeLabel,
              child: CupertinoSlidingSegmentedControl<AppFontSize>(
                groupValue: currentSize,
                padding: const .all(4),
                children: {
                  AppFontSize.small: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.fontSizeSmall)
                  ),
                  AppFontSize.medium: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.fontSizeMedium)
                  ),
                  AppFontSize.large: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.fontSizeLarge)
                  )
                },
                onValueChanged: (AppFontSize? val) {
                  if (val != null) {
                    settings.setFontSize(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),
            CupertinoSettingRow(
              label: context.localizations.fontFamilyLabel,
              child: CupertinoSlidingSegmentedControl<AppFontFamily>(
                groupValue: currentFont,
                padding: const .all(4),
                children: {
                  AppFontFamily.system: Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.themeSystem)
                  ),
                  AppFontFamily.inter: const Padding(
                    padding: .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text('Inter')
                  )
                },
                onValueChanged: (AppFontFamily? val) {
                  if (val != null) {
                    settings.setFontFamily(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),
            CupertinoSettingRow(
              label: context.localizations.languageLabel,
              child: CupertinoSlidingSegmentedControl<String>(
                groupValue: currentLocale,
                padding: const .all(4),
                children: {
                  'system': Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.systemLanguageOption)
                  ),
                  'en': Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.englishOption)
                  ),
                  'fr': Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.frenchOption)
                  ),
                  'es': Padding(
                    padding: const .symmetric(horizontal: kHorizontal, vertical: kVertical),
                    child: Text(context.localizations.spanishOption)
                  )
                },
                onValueChanged: (String? val) {
                  if (val != null) {
                    settings.setLocaleCode(val);
                  }
                }
              )
            )
          ]
        );
      }
    );
  }
}
