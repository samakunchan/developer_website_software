import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/dark_theme_constants.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialDashboardScaffold extends StatelessWidget {
  const MaterialDashboardScaffold({
    required this.isDark,
    required this.authSignals,
    this.onPressed,
    this.sessionStatus,
    super.key,
  });

  final String? sessionStatus;
  final void Function()? onPressed;
  final bool isDark;
  final AuthSignals authSignals;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color primaryColor = theme.colorScheme.primary;
    final Color textContrastColor = isDark ? LightThemeConstants.text : DarkThemeConstants.text;

    return Center(
      child: SingleChildScrollView(
        padding: const .all(32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const .all(24),
          decoration: BoxDecoration(
            color: isDark ? DarkThemeConstants.background : Colors.white,
            borderRadius: .circular(12),
            border: .all(color: isDark ? const Color(0xFF2D2D2D) : Colors.grey.shade300),
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4))],
          ),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Icon(Icons.security, size: 48, color: primaryColor),
              const SizedBox(height: 16),
              Text(
                'Security Control',
                textAlign: .center,
                style: theme.textTheme.titleLarge?.copyWith(fontWeight: .bold),
              ),
              const SizedBox(height: 8),
              const Text('Verify your active user session directly with the API backend.', textAlign: .center),
              const SizedBox(height: 24),

              /// Session Verification Button
              SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = authSignals.isLoading.value;

                  if (loading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      foregroundColor: textContrastColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: .circular(8)),
                    ),
                    child: const Text('Check Session', style: TextStyle(fontWeight: .bold)),
                  );
                },
              ),

              /// Session Status Message
              if (sessionStatus != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const .all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: .circular(8),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      const Icon(Icons.check_circle_outline, color: Colors.green, size: 18),
                      Expanded(
                        child: Text(sessionStatus!, style: const TextStyle(color: Colors.green, fontSize: 13)),
                      ),
                    ],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
