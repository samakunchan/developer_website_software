import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/admin/presentation/signals/admin_signals.dart';
import 'package:developer_website_software/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:developer_website_software/features/messages/presentation/screens/messages_screen.dart';
import 'package:developer_website_software/features/projects/presentation/screens/projects_screen.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/settings_app_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentAdminMainContentArea extends StatelessWidget {
  const FluentAdminMainContentArea({super.key});

  @override
  Widget build(BuildContext context) {
    final AdminSignals signals = kGetIt<AdminSignals>();

    return SignalBuilder(
      builder: (BuildContext context) {
        final AdminPage currentPage = signals.currentPage.value;
        final int index = currentPage.index;

        return IndexedStack(
          index: index,
          children: [
            const DashboardScreen(),
            const MessagesScreen(),
            const Placeholder(), // Profiles
            ProjectsScreen(isActive: currentPage == AdminPage.projects),
            const Placeholder(), // Analytics
            SettingsAppScreen(isActive: currentPage == AdminPage.settings)
          ]
        );
      }
    );
  }
}
