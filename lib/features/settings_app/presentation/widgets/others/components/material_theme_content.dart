import 'dart:async';

import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/others/components/material_theme_selector_grid.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialThemeContent extends StatelessWidget {
  const MaterialThemeContent({required this.signals, super.key});

  final SettingsAppSignals signals;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                Text('Themes & Appearance', style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
                Text(
                  'Choose the interface appearance for your live portfolio website.',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.7))
                )
              ],
            ),
            SignalBuilder(
              builder: (BuildContext context) {
                final bool isFetching = signals.isFetchingTheme.value;
                if (isFetching) {
                  return const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2));
                }
                return IconButton(icon: const Icon(Icons.refresh), onPressed: () => unawaited(signals.fetchTheme()));
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
                color: theme.colorScheme.error.withValues(alpha: 0.1),
                borderRadius: .circular(8),
                border: .all(color: theme.colorScheme.error.withValues(alpha: 0.3))
              ),
              child: Row(
                spacing: 8,
                children: [
                  Icon(Icons.error_outline, color: theme.colorScheme.error, size: 20),
                  Expanded(
                    child: Text(error, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error))
                  )
                ],
              ),
            );
          }
        ),
        MaterialThemeSelectorGrid(
          currentThemeSignal: signals.currentTheme,
          isLoadingSignal: signals.isLoading,
          onThemeSelected: (String id) => unawaited(signals.updateTheme(id))
        ),
      ],
    );
  }
}
