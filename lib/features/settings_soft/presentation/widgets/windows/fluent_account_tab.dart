import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/viewmodels/user_view_model.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_info_row.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_settings_soft_divider.dart';
import 'package:fluent_ui/fluent_ui.dart';

class FluentAccountTab extends StatelessWidget {
  const FluentAccountTab({required this.authSignals, super.key});
  final AuthSignals authSignals;

  @override
  Widget build(BuildContext context) {
    final UserViewModel? user = authSignals.currentUser.value;
    final FluentThemeData theme = FluentTheme.of(context);

    if (user == null) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Icon(FluentIcons.shield, size: 48, color: theme.resources.textFillColorSecondary),
            const SizedBox(height: 12),
            Text(
              'Not Authenticated',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: theme.resources.textFillColorSecondary,
                fontSize: 16
              )
            ),
            const SizedBox(height: 6),
            Text(
              'Please sign in to the application to view your developer account details.',
              textAlign: .center,
              style: TextStyle(color: theme.resources.textFillColorSecondary, fontSize: 13)
            )
          ]
        )
      );
    }

    final Color cardBgColor = theme.resources.cardBackgroundFillColorDefault;

    return Container(
      padding: const .all(16),
      decoration: BoxDecoration(color: cardBgColor, borderRadius: .circular(12)),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const .all(12),
                decoration: BoxDecoration(color: theme.accentColor, shape: .circle),
                child: const Icon(FluentIcons.contact, color: Colors.white, size: 28)
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(
                      user.name,
                      style: const TextStyle(fontWeight: .bold, fontSize: 18)
                    ),
                    Text(
                      user.role.toUpperCase(),
                      style: TextStyle(fontSize: 11, color: theme.accentColor, fontWeight: .w600)
                    )
                  ]
                )
              )
            ]
          ),
          const SizedBox(height: 20),
          const FluentSettingsSoftDivider(),
          const SizedBox(height: 16),
          FluentInfoRow(label: 'Account ID', value: '#${user.id}'),
          const SizedBox(height: 12),
          FluentInfoRow(label: 'Email Address', value: user.email)
        ]
      )
    );
  }
}
