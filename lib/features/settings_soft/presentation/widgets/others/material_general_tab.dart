import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_setting_row.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialGeneralTab extends StatelessWidget {
  const MaterialGeneralTab({required this.settings, super.key});
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
            // Theme setting
            MaterialSettingRow(
              label: context.localizations.appearanceLabel,
              child: SegmentedButton<ThemeMode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: .system, label: Text(context.localizations.themeSystem)),
                  ButtonSegment(value: .light, label: Text(context.localizations.themeLight)),
                  ButtonSegment(value: .dark, label: Text(context.localizations.themeDark)),
                ],
                selected: {currentTheme},
                onSelectionChanged: (Set<ThemeMode> selection) {
                  settings.setThemeMode(selection.first);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Font Size setting
            MaterialSettingRow(
              label: context.localizations.fontSizeLabel,
              child: SegmentedButton<AppFontSize>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: .small, label: Text(context.localizations.fontSizeSmall)),
                  ButtonSegment(value: .medium, label: Text(context.localizations.fontSizeMedium)),
                  ButtonSegment(value: .large, label: Text(context.localizations.fontSizeLarge)),
                ],
                selected: {currentSize},
                onSelectionChanged: (Set<AppFontSize> selection) {
                  settings.setFontSize(selection.first);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Font Family setting
            MaterialSettingRow(
              label: context.localizations.fontFamilyLabel,
              child: SegmentedButton<AppFontFamily>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: .system, label: Text(context.localizations.themeSystem)),
                  const ButtonSegment(value: .inter, label: Text('Inter')),
                ],
                selected: {currentFont},
                onSelectionChanged: (Set<AppFontFamily> selection) {
                  settings.setFontFamily(selection.first);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Language setting
            MaterialSettingRow(
              label: context.localizations.languageLabel,
              child: SegmentedButton<String>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: 'system', label: Text(context.localizations.systemLanguageOption)),
                  ButtonSegment(value: 'en', label: Text(context.localizations.englishOption)),
                  ButtonSegment(value: 'fr', label: Text(context.localizations.frenchOption)),
                  ButtonSegment(value: 'es', label: Text(context.localizations.spanishOption)),
                ],
                selected: {currentLocale},
                onSelectionChanged: (Set<String> selection) {
                  settings.setLocaleCode(selection.first);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
