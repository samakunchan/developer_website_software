import 'package:developer_website_software/core/themes/constantes.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings/presentation/widgets/info_row.dart';
import 'package:developer_website_software/features/settings/presentation/widgets/settings_divider.dart';
import 'package:flutter/cupertino.dart';

class AccountTab extends StatelessWidget {
  const AccountTab({required this.authSignals, super.key});
  final AuthSignals authSignals;

  @override
  Widget build(BuildContext context) {
    final UserEntity? user = authSignals.currentUser.value;
    final bool isDark = CupertinoTheme.brightnessOf(context) == Brightness.dark;

    if (user == null) {
      return Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Icon(CupertinoIcons.lock_shield, size: 48, color: CupertinoColors.systemGrey),
            const SizedBox(height: 12),
            Text(
              'Not Authenticated',
              style: CupertinoTheme.of(
                context,
              ).textTheme.textStyle.copyWith(fontWeight: .bold, color: CupertinoColors.systemGrey),
            ),
            const SizedBox(height: 6),
            Text(
              'Please sign in to the application to view your developer account details.',
              textAlign: .center,
              style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                color: CupertinoColors.systemGrey,
                fontSize: 13,
              ),
            ),
          ],
        ),
      );
    }

    final Color cardBgColor = isDark ? kCardSecondaryDarkBgColor : CupertinoColors.extraLightBackgroundGray;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardBgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(color: CupertinoColors.activeBlue, shape: .circle),
                child: const Icon(CupertinoIcons.person, color: CupertinoColors.white, size: 28),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 2,
                  children: [
                    Text(
                      user.name,
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(fontWeight: .bold, fontSize: 18),
                    ),
                    Text(
                      user.role.toUpperCase(),
                      style: CupertinoTheme.of(context).textTheme.textStyle.copyWith(
                        fontSize: 11,
                        color: CupertinoColors.activeBlue,
                        fontWeight: .w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const SettingsDivider(color: CupertinoColors.separator),
          const SizedBox(height: 16),
          InfoRow(label: 'Account ID', value: '#${user.id}'),
          const SizedBox(height: 12),
          InfoRow(label: 'Email Address', value: user.email),
        ],
      ),
    );
  }
}
