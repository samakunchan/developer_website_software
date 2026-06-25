import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/admin/presentation/screens/macos/cupertino_admin_scaffold.dart';
import 'package:developer_website_software/features/admin/presentation/screens/others/material_admin_scaffold.dart';
import 'package:developer_website_software/features/admin/presentation/screens/windows/fluent_admin_scaffold.dart';
import 'package:developer_website_software/features/admin/presentation/signals/admin_signals.dart';
import 'package:flutter/widgets.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AdminScreen extends PlatformWidget {
  const AdminScreen({super.key});

  @override
  Widget buildCupertino(BuildContext context) {
    final AdminSignals signals = kGetIt<AdminSignals>();
    return SignalBuilder(
      builder: (BuildContext context) => CupertinoAdminScaffold(
        sidebarWidth: signals.sidebarWidth.value,
        onSidebarResized: signals.resizeSidebar
      )
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    final AdminSignals signals = kGetIt<AdminSignals>();
    return SignalBuilder(
      builder: (BuildContext context) => FluentAdminScaffold(
        sidebarWidth: signals.sidebarWidth.value,
        onSidebarResized: signals.resizeSidebar
      )
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    final AdminSignals signals = kGetIt<AdminSignals>();
    return SignalBuilder(
      builder: (BuildContext context) => MaterialAdminScaffold(
        sidebarWidth: signals.sidebarWidth.value,
        onSidebarResized: signals.resizeSidebar
      )
    );
  }
}
