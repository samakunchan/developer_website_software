import 'package:developer_website_software/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:developer_website_software/features/settings_app/presentation/screens/settings_app_screen.dart';
import 'package:flutter/widgets.dart';

class MaterialAdminMainContentArea extends StatelessWidget {
  const MaterialAdminMainContentArea({required this.selectedNavIndex, super.key});

  final int selectedNavIndex;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectedNavIndex,
      children: const [
        DashboardScreen(),
        Placeholder(), // Messages
        Placeholder(), // Profiles
        Placeholder(), // Projects
        Placeholder(), // Analytics
        SettingsAppScreen()
      ]
    );
  }
}
