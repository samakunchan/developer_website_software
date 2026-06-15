import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart' as di;
import 'package:developer_website_software/core/themes/theme.dart';
import 'package:developer_website_software/features/authentication/presentation/screens/login_screen.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_window_utils/macos_window_utils.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize dependency injection
  await di.initDependencyInjection();

  /// Check session on startup
  await di.kGetIt<AuthSignals>().checkSession();

  /// Initialize macos_window_utils for transparency & vibrancy effects
  await WindowManipulator.initialize(enableWindowDelegate: true);

  /// Initialize Window Manager for desktop integration
  await windowManager.ensureInitialized();
  const WindowOptions windowOptions = WindowOptions(
    size: Size(900, 650),
    minimumSize: Size(800, 600),
    center: true,
    skipTaskbar: false,
    titleBarStyle: .hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const MyApp());
}

class MyApp extends PlatformWidget {
  const MyApp({super.key});

  @override
  Widget buildCupertino(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Software',
      theme: AppTheme.cupertinoThemeData,
      home: LoginScreen(),
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Software',
      theme: AppTheme.fluentLightTheme,
      darkTheme: AppTheme.fluentDarkTheme,
      home: const LoginScreen(),
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Software',
      theme: AppTheme.materialLightTheme,
      darkTheme: AppTheme.materialDarkTheme,
      home: const LoginScreen(),
    );
  }
}
