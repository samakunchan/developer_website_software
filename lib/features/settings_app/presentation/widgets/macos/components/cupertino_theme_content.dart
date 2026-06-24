import 'dart:async';

import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/widgets/macos/components/cupertino_theme_selector_grid.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/widgets/cupertino_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoThemeContent extends StatelessWidget {
  const CupertinoThemeContent({required this.signals, super.key});

  final SettingsAppSignals signals;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: 20,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 4,
                children: [
                  Text(
                    'Themes & Appearance',
                    style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 24, fontWeight: .bold),
                  ),
                  SizedBox(
                    width: 500,
                    child: Text(
                      'Choose the interface appearance for your live portfolio website.',
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: CupertinoColors.secondaryLabel),
                      overflow: .ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            SignalBuilder(
              builder: (_) {
                final bool isFetching = signals.isFetchingTheme.value;
                if (isFetching) {
                  return const CupertinoActivityIndicator();
                }
                return CupertinoAppButton(onPressed: signals.fetchTheme, child: const Icon(CupertinoIcons.refresh, size: 20));
              }
            ),
          ],
        ),

        /// Error notification
        SignalBuilder(
          builder: (_) {
            final String? error = signals.errorMessage.value;
            if (error != null) {
              return Container(
                padding: const .all(12),
                decoration: BoxDecoration(
                  color: kDangerColor.withValues(alpha: 0.1),
                  borderRadius: .circular(8),
                  border: .all(color: kDangerColor.withValues(alpha: 0.3)),
                ),
                child: Row(
                  spacing: 8,
                  children: [
                    const Icon(CupertinoIcons.exclamationmark_triangle_fill, color: kDangerColor, size: 16),
                    Expanded(
                      child: Text(
                        error,
                        style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(color: kDangerColor, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ),

        /// Themes list
        CupertinoThemeSelectorGrid(
          currentThemeSignal: signals.currentTheme,
          isLoadingSignal: signals.isLoading,
          onThemeSelected: (String id) => unawaited(signals.updateTheme(id))
        ),
      ],
    );
  }
}
