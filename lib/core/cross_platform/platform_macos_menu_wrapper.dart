import 'dart:async';
import 'dart:io';

import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings/presentation/widgets/settings_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PlatformMacosMenuWrapper extends StatelessWidget {
  const PlatformMacosMenuWrapper({required this.child, super.key});
  final Widget child;

  void _showAboutDialog(BuildContext context) {
    unawaited(
      showCupertinoDialog<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('About Developer Website Sofware'),
          content: const Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Developer Website Sofware v0.3.0\n\nManage your developer portfolio locally with ease.',
              textAlign: TextAlign.center,
            ),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }

  void _showSettingsDialog(BuildContext context) {
    unawaited(
      showCupertinoDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => const SettingsDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!Platform.isMacOS) {
      return child;
    }

    final AuthSignals authSignals = kGetIt<AuthSignals>();

    return SignalBuilder(
      builder: (BuildContext context) {
        final user = authSignals.currentUser.value;

        return PlatformMenuBar(
          menus: <PlatformMenuItem>[
            PlatformMenu(
              label: 'Developer Website Sofware',
              menus: <PlatformMenuItem>[
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'About Developer Website Sofware',
                      onSelected: () => _showAboutDialog(context),
                    ),
                  ],
                ),
                PlatformMenuItemGroup(
                  members: <PlatformMenuItem>[
                    PlatformMenuItem(
                      label: 'Settings...',
                      shortcut: const SingleActivator(LogicalKeyboardKey.comma, meta: true),
                      onSelected: () => _showSettingsDialog(context),
                    ),
                  ],
                ),
                if (user != null)
                  PlatformMenuItemGroup(
                    members: <PlatformMenuItem>[
                      PlatformMenuItem(
                        label: 'Sign Out',
                        onSelected: () => unawaited(authSignals.signOut()),
                      ),
                    ],
                  ),
                const PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.quit,
                ),
              ],
            ),
            const PlatformMenu(
              label: 'Window',
              menus: <PlatformMenuItem>[
                PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.minimizeWindow,
                ),
                PlatformProvidedMenuItem(
                  type: PlatformProvidedMenuItemType.zoomWindow,
                ),
              ],
            ),
          ],
          child: child,
        );
      },
    );
  }
}
