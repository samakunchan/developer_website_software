import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_account_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/windows/fluent_general_tab.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentSettingsSoftDialog extends StatefulWidget {
  const FluentSettingsSoftDialog({super.key});

  @override
  State<FluentSettingsSoftDialog> createState() => _FluentSettingsSoftDialogState();
}

class _FluentSettingsSoftDialogState extends State<FluentSettingsSoftDialog> {
  int _activeTab = 0; // 0 for General, 1 for Account Info

  @override
  Widget build(BuildContext context) {
    final SettingsSoftSignals settings = kGetIt<SettingsSoftSignals>();
    final AuthSignals authSignals = kGetIt<AuthSignals>();

    final bool isGeneral = _activeTab == 0;
    final bool isAccount = _activeTab == 1;

    return ContentDialog(
      title: const Text('Preferences'),
      constraints: const BoxConstraints(maxWidth: 480, maxHeight: 420),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: .stretch,
        spacing: 16,
        children: [
          Row(
            spacing: 8,
            children: [
              if (isGeneral)
                const FilledButton(
                  onPressed: null,
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 6,
                    children: [Icon(FluentIcons.settings, size: 14), Text('General')]
                  )
                )
              else
                Button(
                  onPressed: () => setState(() => _activeTab = 0),
                  child: const Row(
                    mainAxisSize: .min,
                    spacing: 6,
                    children: [Icon(FluentIcons.settings, size: 14), Text('General')]
                  )
                ),
              if (isAccount)
                const FilledButton(
                  onPressed: null,
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 6,
                    children: [Icon(FluentIcons.contact, size: 14), Text('Account Info')]
                  )
                )
              else
                Button(
                  onPressed: () => setState(() => _activeTab = 1),
                  child: const Row(
                    mainAxisSize: .min,
                    spacing: 6,
                    children: [Icon(FluentIcons.contact, size: 14), Text('Account Info')]
                  )
                )
            ]
          ),
          Expanded(
            child: Padding(
              padding: const .only(top: 8),
              child: SignalBuilder(
                builder: (BuildContext context) {
                  if (_activeTab == 0) {
                    return FluentGeneralTab(settings: settings);
                  } else {
                    return FluentAccountTab(authSignals: authSignals);
                  }
                }
              )
            )
          )
        ]
      ),
      actions: [
        Button(
          child: const Text('Close'),
          onPressed: () => Navigator.of(context).pop()
        )
      ]
    );
  }
}
