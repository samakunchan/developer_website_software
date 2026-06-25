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

        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            // Theme setting
            FluentSettingRow(
              label: 'Appearance',
              child: ComboBox<ThemeMode>(
                value: currentTheme,
                items: const [
                  ComboBoxItem(value: ThemeMode.system, child: Text('System')),
                  ComboBoxItem(value: ThemeMode.light, child: Text('Light')),
                  ComboBoxItem(value: ThemeMode.dark, child: Text('Dark'))
                ],
                onChanged: (ThemeMode? val) {
                  if (val != null) {
                    settings.setThemeMode(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),

            // Font Size setting
            FluentSettingRow(
              label: 'Font Size',
              child: ComboBox<AppFontSize>(
                value: currentSize,
                items: [
                  ComboBoxItem(value: AppFontSize.small, child: Text(AppFontSize.small.value)),
                  ComboBoxItem(value: AppFontSize.medium, child: Text(AppFontSize.medium.value)),
                  ComboBoxItem(value: AppFontSize.large, child: Text(AppFontSize.large.value))
                ],
                onChanged: (AppFontSize? val) {
                  if (val != null) {
                    settings.setFontSize(val);
                  }
                }
              )
            ),
            const SizedBox(height: 16),

            // Font Family setting
            FluentSettingRow(
              label: 'Font Family',
              child: ComboBox<AppFontFamily>(
                value: currentFont,
                items: const [
                  ComboBoxItem(value: AppFontFamily.system, child: Text('System')),
                  ComboBoxItem(value: AppFontFamily.inter, child: Text('Inter'))
                ],
                onChanged: (AppFontFamily? val) {
                  if (val != null) {
                    settings.setFontFamily(val);
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
