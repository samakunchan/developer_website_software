import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/features/admin/presentation/screens/macos/cupertino_admin_scaffold.dart';
import 'package:developer_website_software/features/admin/presentation/screens/others/material_admin_scaffold.dart';
import 'package:developer_website_software/features/admin/presentation/screens/windows/fluent_admin_scaffold.dart';
import 'package:flutter/widgets.dart';

class AdminScreen extends PlatformStatefulWidget {
  const AdminScreen({super.key});

  @override
  PlatformState<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends PlatformState<AdminScreen> {
  double _sidebarWidth = 220;
  static const double minSidebarWidth = 160;
  static const double maxSidebarWidth = 320;

  void _onSidebarResized(double delta) {
    setState(() {
      _sidebarWidth = (_sidebarWidth + delta).clamp(minSidebarWidth, maxSidebarWidth);
    });
  }

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoAdminScaffold(sidebarWidth: _sidebarWidth, onSidebarResized: _onSidebarResized);
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentAdminScaffold(sidebarWidth: _sidebarWidth, onSidebarResized: _onSidebarResized);
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialAdminScaffold(sidebarWidth: _sidebarWidth, onSidebarResized: _onSidebarResized);
  }
}
