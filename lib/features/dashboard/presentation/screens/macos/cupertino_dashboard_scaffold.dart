import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:developer_website_software/features/themes/widgets/cupertino_app_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoDashboardScaffold extends StatelessWidget {
  const CupertinoDashboardScaffold({
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
    return Center(
      child: SingleChildScrollView(
        padding: const .all(32),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          padding: const .all(24),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E1E1E) : CupertinoColors.white,
            borderRadius: .circular(12),
            border: Border.all(color: isDark ? const Color(0xFF2D2D2D) : CupertinoColors.systemGrey5),
            boxShadow: [
              BoxShadow(color: CupertinoColors.black.withValues(alpha: 0.05), blurRadius: 10, offset: const Offset(0, 4)),
            ],
          ),
          child: Column(
            mainAxisSize: .min,
            crossAxisAlignment: .stretch,
            children: [
              const Icon(CupertinoIcons.lock_shield, size: 48, color: kPrimaryColor),
              const SizedBox(height: 16),
              const Text('Security Control', textAlign: .center),
              const SizedBox(height: 8),
              const Text('Verify your active user session directly with the API backend.', textAlign: .center),
              const SizedBox(height: 24),

              /// Session Verification Button
              SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = authSignals.isLoading.value;

                  if (loading) {
                    return const Center(child: CupertinoActivityIndicator());
                  }

                  return CupertinoAppButton(textButton: 'Check Session', onPressed: onPressed);
                },
              ),

              /// Session Status Message
              if (sessionStatus != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const .all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4CAF50).withValues(alpha: 0.1),
                    borderRadius: .circular(8),
                    border: Border.all(color: const Color(0xFF4CAF50).withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    spacing: 8,
                    children: [
                      const Icon(CupertinoIcons.checkmark_circle, color: Color(0xFF4CAF50), size: 18),
                      Expanded(
                        child: Text(sessionStatus!, style: const TextStyle(color: Color(0xFF4CAF50), fontSize: 13)),
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
