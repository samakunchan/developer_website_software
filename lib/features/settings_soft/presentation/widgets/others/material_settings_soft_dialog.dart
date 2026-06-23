import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_account_tab.dart';
import 'package:developer_website_software/features/settings_soft/presentation/widgets/others/material_general_tab.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialSettingsSoftDialog extends StatefulWidget {
  const MaterialSettingsSoftDialog({super.key});

  @override
  State<MaterialSettingsSoftDialog> createState() => _MaterialSettingsSoftDialogState();
}

class _MaterialSettingsSoftDialogState extends State<MaterialSettingsSoftDialog> {
  int _activeTab = 0; // 0 for General, 1 for Account Info

  @override
  Widget build(BuildContext context) {
    final SettingsSoftSignals settings = kGetIt<SettingsSoftSignals>();
    final AuthSignals authSignals = kGetIt<AuthSignals>();

    return AlertDialog(
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          const Text('Preferences'),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop()
          )
        ]
      ),
      content: SizedBox(
        width: 480,
        height: 380,
        child: Column(
          crossAxisAlignment: .stretch,
          spacing: 16,
          children: [
            SegmentedButton<int>(
              showSelectedIcon: false,
              segments: const [
                ButtonSegment(
                  value: 0,
                  icon: Icon(Icons.settings, size: 18),
                  label: Text('General')
                ),
                ButtonSegment(
                  value: 1,
                  icon: Icon(Icons.person, size: 18),
                  label: Text('Account Info')
                )
              ],
              selected: {_activeTab},
              onSelectionChanged: (Set<int> selection) {
                setState(() {
                  _activeTab = selection.first;
                });
              }
            ),
            Expanded(
              child: Padding(
                padding: const .only(top: 8),
                child: SignalBuilder(
                  builder: (BuildContext context) {
                    if (_activeTab == 0) {
                      return MaterialGeneralTab(settings: settings);
                    } else {
                      return MaterialAccountTab(authSignals: authSignals);
                    }
                  }
                )
              )
            )
          ]
        )
      )
    );
  }
}
