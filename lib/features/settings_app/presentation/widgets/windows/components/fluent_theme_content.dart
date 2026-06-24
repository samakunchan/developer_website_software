import 'dart:async';

import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/windows/components/fluent_theme_selector_grid.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentThemeContent extends StatelessWidget {
  const FluentThemeContent({required this.signals, super.key});

  final SettingsAppSignals signals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);

    return Column(
      crossAxisAlignment: .start,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              crossAxisAlignment: .start,
              spacing: 4,
              children: [
                Text('Themes & Appearance', style: theme.typography.subtitle?.copyWith(fontWeight: .bold)),
                Text(
                  'Choose the interface appearance for your live portfolio website.',
                  style: theme.typography.body?.copyWith(color: theme.resources.textFillColorSecondary)
                ),
              ],
            ),
            SignalBuilder(
              builder: (BuildContext context) {
                final bool isFetching = signals.isFetchingTheme.value;
                if (isFetching) {
                  return const SizedBox(width: 20, height: 20, child: ProgressRing());
                }
                return IconButton(icon: const Icon(FluentIcons.refresh), onPressed: signals.fetchTheme);
              }
            ),
          ],
        ),
        SignalBuilder(
          builder: (BuildContext context) {
            final String? error = signals.errorMessage.value;
            if (error == null) return const SizedBox();
            return Container(
              padding: const .all(12),
              decoration: BoxDecoration(
                color: theme.accentColor.lightest.withValues(alpha: 0.1),
                borderRadius: .circular(8),
                border: .all(color: theme.accentColor.lightest.withValues(alpha: 0.3))
              ),
              child: Row(
                spacing: 8,
                children: [
                  const Icon(FluentIcons.error, color: Color(0xFFFF4343), size: 20),
                  Expanded(
                    child: Text(error, style: theme.typography.body?.copyWith(color: const Color(0xFFFF4343)))
                  ),
                ],
              ),
            );
          }
        ),
        FluentThemeSelectorGrid(
          currentThemeSignal: signals.currentTheme,
          isLoadingSignal: signals.isLoading,
          onThemeSelected: (String id) => unawaited(signals.updateTheme(id))
        ),
      ],
    );
  }
}
