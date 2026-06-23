import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/macos/cupertino_account_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_account_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_account_tab.dart';
import 'package:flutter/widgets.dart';

class AccountTab extends PlatformWidget {
  const AccountTab({required this.authSignals, super.key});
  final AuthSignals authSignals;

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAccountTab(authSignals: authSignals);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAccountTab(authSignals: authSignals);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAccountTab(authSignals: authSignals);
  }
}
