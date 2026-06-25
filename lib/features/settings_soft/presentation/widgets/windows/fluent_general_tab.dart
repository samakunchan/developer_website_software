import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_setting_row.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentGeneralTab extends StatelessWidget {
  const FluentGeneralTab({required this.settings, super.key});
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
            FluentSettingRow(
              label: context.localizations.appearanceLabel,
              child: ComboBox<ThemeMode>(
                value: currentTheme,
                items: [
                  ComboBoxItem(value: .system, child: Text(context.localizations.themeSystem)),
                  ComboBoxItem(value: .light, child: Text(context.localizations.themeLight)),
                  ComboBoxItem(value: .dark, child: Text(context.localizations.themeDark)),
                ],
                onChanged: (ThemeMode? val) {
                  if (val != null) {
                    settings.setThemeMode(val);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Font Size setting
            FluentSettingRow(
              label: context.localizations.fontSizeLabel,
              child: ComboBox<AppFontSize>(
                value: currentSize,
                items: [
                  ComboBoxItem(value: .small, child: Text(context.localizations.fontSizeSmall)),
                  ComboBoxItem(value: .medium, child: Text(context.localizations.fontSizeMedium)),
                  ComboBoxItem(value: .large, child: Text(context.localizations.fontSizeLarge)),
                ],
                onChanged: (AppFontSize? val) {
                  if (val != null) {
                    settings.setFontSize(val);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Font Family setting
            FluentSettingRow(
              label: context.localizations.fontFamilyLabel,
              child: ComboBox<AppFontFamily>(
                value: currentFont,
                items: [
                  ComboBoxItem(value: .system, child: Text(context.localizations.themeSystem)),
                  const ComboBoxItem(value: .inter, child: Text('Inter')),
                ],
                onChanged: (AppFontFamily? val) {
                  if (val != null) {
                    settings.setFontFamily(val);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Language setting
            FluentSettingRow(
              label: context.localizations.languageLabel,
              child: ComboBox<String>(
                value: currentLocale,
                items: [
                  ComboBoxItem(value: 'system', child: Text(context.localizations.systemLanguageOption)),
                  ComboBoxItem(value: 'en', child: Text(context.localizations.englishOption)),
                  ComboBoxItem(value: 'fr', child: Text(context.localizations.frenchOption)),
                  ComboBoxItem(value: 'es', child: Text(context.localizations.spanishOption)),
                ],
                onChanged: (String? val) {
                  if (val != null) {
                    settings.setLocaleCode(val);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
