import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/core/utils/jwt_decoder.dart';
import 'package:developer_website_software/features/authentication/data/datasources/auth_cache_data_source.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/dashboard/presentation/screens/macos/cupertino_dashboard_scaffold.dart';
import 'package:developer_website_software/features/dashboard/presentation/screens/others/material_dashboard_scaffold.dart';
import 'package:developer_website_software/features/dashboard/presentation/screens/windows/fluent_dashboard_scaffold.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:intl/intl.dart';

class DashboardScreen extends PlatformStatefulWidget {
  const DashboardScreen({super.key});

  @override
  PlatformState<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends PlatformState<DashboardScreen> {
  String? _sessionStatus;

  Future<void> _checkSession(AuthSignals authSignals) async {
    setState(() {
      _sessionStatus = null;
    });

    await authSignals.checkSession();

    if (!mounted) return;

    if (authSignals.currentUser.value != null) {
      final String? token = await kGetIt<AuthCacheDataSource>().getToken();

      if (!mounted) return;

      DateTime? expDate;
      if (token != null) {
        expDate = JwtDecoder.getExpirationDate(token);
      }

      final String status;
      if (expDate != null) {
        final String formattedExp = DateFormat('yyyy-MM-dd HH:mm:ss').format(expDate);
        status = 'Session is active. Token expires at $formattedExp';
      } else {
        final String time = DateFormat('HH:mm:ss').format(DateTime.now());
        status = 'Session is active and verified successfully at $time';
      }

      setState(() {
        _sessionStatus = status;
      });
    }
  }

  @override
  Widget buildCupertino(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final bool isDark = CupertinoTheme.brightnessOf(context) == .dark;

    return CupertinoDashboardScaffold(
      onPressed: () => _checkSession(authSignals),
      isDark: isDark,
      authSignals: authSignals,
      sessionStatus: _sessionStatus,
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final bool isDark = fluent.FluentTheme.of(context).brightness == .dark;

    return FluentDashboardScaffold(
      onPressed: () => _checkSession(authSignals),
      isDark: isDark,
      authSignals: authSignals,
      sessionStatus: _sessionStatus,
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final bool isDark = material.Theme.of(context).brightness == .dark;

    return MaterialDashboardScaffold(
      onPressed: () => _checkSession(authSignals),
      isDark: isDark,
      authSignals: authSignals,
      sessionStatus: _sessionStatus,
    );
  }
}
