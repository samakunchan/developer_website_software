import 'dart:ui';

import 'package:developer_website_software/core/cross_platform/platform_macos_menu_wrapper.dart';
import 'package:developer_website_software/core/cross_platform/platform_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart' as di;
import 'package:developer_website_software/features/authentication/presentation/screens/login_screen.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/settings/presentation/signals/settings_signals.dart';
import 'package:developer_website_software/features/themes/presentation/theme.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_window_utils/macos_window_utils.dart';
import 'package:signals_flutter/signals_flutter.dart';
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
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (BuildContext context) {
        return super.build(context);
      },
    );
  }

  @override
  Widget buildCupertino(BuildContext context) {
    final SettingsSignals settings = di.kGetIt<SettingsSignals>();
    final ThemeMode themeMode = settings.themeMode.value;
    final AppFontSize fontSize = settings.fontSize.value;
    final AppFontFamily fontFamily = settings.fontFamily.value;

    final Brightness brightness = themeMode == ThemeMode.system
        ? PlatformDispatcher.instance.platformBrightness
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    final CupertinoThemeData dynamicTheme = AppTheme.getCupertinoTheme(
      brightness,
      fontFamily.value,
      fontSize.multiplier,
    );

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Sofware',
      theme: dynamicTheme,
      home: const PlatformMacosMenuWrapper(child: LoginScreen()),
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    final SettingsSignals settings = di.kGetIt<SettingsSignals>();
    final ThemeMode themeMode = settings.themeMode.value;

    final Brightness brightness = themeMode == ThemeMode.system
        ? PlatformDispatcher.instance.platformBrightness
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    // Dynamic Fluent theme or simple toggle
    final fluentTheme = brightness == Brightness.dark ? AppTheme.fluentDarkTheme : AppTheme.fluentLightTheme;

    return FluentApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Sofware',
      theme: fluentTheme,
      home: const LoginScreen(),
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    final SettingsSignals settings = di.kGetIt<SettingsSignals>();
    final ThemeMode themeMode = settings.themeMode.value;
    final AppFontSize fontSize = settings.fontSize.value;
    final AppFontFamily fontFamily = settings.fontFamily.value;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Developer Website Sofware',
      theme: AppTheme.getMaterialTheme(Brightness.light, fontFamily.value, fontSize.multiplier),
      darkTheme: AppTheme.getMaterialTheme(Brightness.dark, fontFamily.value, fontSize.multiplier),
      themeMode: themeMode,
      home: const LoginScreen(),
    );
  }
}
