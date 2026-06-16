import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentDashboardScaffold extends StatelessWidget {
  const FluentDashboardScaffold({required this.isDark, required this.authSignals, this.onPressed, this.sessionStatus, super.key});

  final String? sessionStatus;
  final void Function()? onPressed;
  final bool isDark;
  final AuthSignals authSignals;

  @override
  Widget build(BuildContext context) {
    final FluentThemeData theme = FluentTheme.of(context);
    final Color primaryColor = theme.accentColor;

    return Center(
      child: SingleChildScrollView(
        padding: const .all(24),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 480),
          padding: const .all(24),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF202020) : const Color(0xFFFAFAFA),
            borderRadius: .circular(8),
            border: Border.all(color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE5E5E5))
          ),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              Icon(FluentIcons.shield, size: 40, color: primaryColor),
              const SizedBox(height: 16),
              Text(
                'Security Control',
                textAlign: .center,
                style: TextStyle(fontSize: 20, fontWeight: .bold, color: isDark ? Colors.white : Colors.black)
              ),
              const SizedBox(height: 8),
              const Text(
                'Verify your active user session directly with the API backend.',
                textAlign: .center,
                style: TextStyle(fontSize: 13, color: Colors.grey)
              ),
              const SizedBox(height: 24),

              /// Session Verification Button
              SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = authSignals.isLoading.value;

                  if (loading) {
                    return const Center(child: ProgressRing());
                  }

                  return FilledButton(onPressed: onPressed, child: const Text('Check Session'));
                }
              ),

              /// Session Status Message
              if (sessionStatus != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const .all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.withValues(alpha: 0.1),
                    borderRadius: .circular(4),
                    border: Border.all(color: Colors.green.withValues(alpha: 0.3))
                  ),
                  child: Row(
                    children: [
                      const Icon(FluentIcons.completed, color: Color(0xFF4CAF50), size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(sessionStatus!, style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 12))
                      )
                    ]
                  )
                )
              ]
            ]
          )
        )
      )
    );
  }
}
