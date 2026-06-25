import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/viewmodels/user_view_model.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_info_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_settings_soft_divider.dart';
import 'package:flutter/material.dart';

class MaterialAccountTab extends StatelessWidget {
  const MaterialAccountTab({required this.authSignals, super.key});
  final AuthSignals authSignals;

  @override
  Widget build(BuildContext context) {
    final UserViewModel? user = authSignals.currentUser.value;
    final ThemeData theme = Theme.of(context);

    if (user == null) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.lock_outline, size: 48, color: theme.colorScheme.onSurfaceVariant),
            const SizedBox(height: 12),
            Text(
              context.localizations.notAuthenticated,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: .bold, color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: 6),
            Text(
              context.localizations.authHelpText,
              textAlign: .center,
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant, fontSize: 13),
            ),
          ],
        ),
      );
    }

    final Color cardBgColor = theme.colorScheme.brightness == .dark ? const Color(0xFF2C2C2E) : Colors.grey.shade100;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(color: cardBgColor, borderRadius: .circular(12)),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 26,
                backgroundColor: theme.colorScheme.primary,
                child: const Icon(Icons.person, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(user.name, style: theme.textTheme.titleLarge?.copyWith(fontWeight: .bold)),
                    Text(
                      user.role.toUpperCase(),
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary, fontWeight: .w600),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const MaterialSettingsSoftDivider(),
          const SizedBox(height: 16),
          MaterialInfoRow(label: context.localizations.accountIdLabel, value: '#${user.id}'),
          const SizedBox(height: 12),
          MaterialInfoRow(label: context.localizations.emailAddressLabel, value: user.email),
        ],
      ),
    );
  }
}
