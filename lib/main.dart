import 'dart:async';
import 'dart:ui';

import 'package:developer_website_software/core/cross_platform/platform_macos_menu_wrapper.dart';
import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart' as di;
import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/auth_gate.dart';
import 'package:developer_website_software/features/messages/presentation/signals/messages_signals.dart';
import 'package:developer_website_software/features/settings_app/presentation/signals/settings_app_signals.dart';
import 'package:developer_website_software/features/settings_soft/presentation/signals/settings_soft_signals.dart';
import 'package:developer_website_software/features/themes/presentation/theme.dart';
import 'package:developer_website_software/l10n/app_localizations.dart';
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

  /// Fetch theme on startup (non-blocking)
  unawaited(di.kGetIt<SettingsAppSignals>().fetchTheme());

  /// Initialize macos_window_utils for transparency & vibrancy effects
  await WindowManipulator.initialize(enableWindowDelegate: true);

  /// Initialize Window Manager for desktop integration
  await windowManager.ensureInitialized();
  final bool isLoggedIn = di.kGetIt<AuthSignals>().currentUser.value != null;
  await di.kGetIt<MessagesSignals>().fetchMessages();
  await di.kGetIt<MessagesSignals>().fetchUnreadCount();
  final Size initialSize = isLoggedIn ? const Size(1280, 1024) : const Size(900, 650);

  final WindowOptions windowOptions = WindowOptions(
    size: initialSize,
    minimumSize: const Size(900, 800),
    center: true,
    skipTaskbar: false,
    titleBarStyle: .hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();

    effect(() async {
      final user = di.kGetIt<AuthSignals>().currentUser.value;
      if (user != null) {
        await windowManager.setSize(const Size(1280, 1024));
        await windowManager.center();
      } else {
        await windowManager.setSize(const Size(900, 650));
        await windowManager.center();
      }
    });
  });

  runApp(const MyApp());
}

class MyApp extends PlatformStatefulWidget {
  const MyApp({super.key});

  @override
  PlatformState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends PlatformState<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangePlatformBrightness() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SignalBuilder(
      builder: (BuildContext context) {
        return super.build(context);
      }
    );
  }

  @override
  Widget buildCupertino(BuildContext context) {
    final SettingsSoftSignals settings = di.kGetIt<SettingsSoftSignals>();
    final ThemeMode themeMode = settings.themeMode.value;
    final AppFontSize fontSize = settings.fontSize.value;
    final AppFontFamily fontFamily = settings.fontFamily.value;
    final String localeCode = settings.localeCode.value;
    final Locale? locale = localeCode == 'system' ? null : Locale(localeCode);

    final Brightness brightness = themeMode == ThemeMode.system
        ? PlatformDispatcher.instance.platformBrightness
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    final CupertinoThemeData dynamicTheme = AppTheme.getCupertinoTheme(
      brightness,
      fontFamily.value,
      fontSize.multiplier
    );

    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => context.localizations.mainTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: dynamicTheme,
      home: const PlatformMacosMenuWrapper(child: AuthGate())
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    final SettingsSoftSignals settings = di.kGetIt<SettingsSoftSignals>();
    final ThemeMode themeMode = settings.themeMode.value;
    final String localeCode = settings.localeCode.value;
    final Locale? locale = localeCode == 'system' ? null : Locale(localeCode);

    final Brightness brightness = themeMode == ThemeMode.system
        ? PlatformDispatcher.instance.platformBrightness
        : (themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light);

    final FluentThemeData fluentTheme = brightness == Brightness.dark ? AppTheme.fluentDarkTheme : AppTheme.fluentLightTheme;

    return FluentApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => context.localizations.mainTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: fluentTheme,
      home: const AuthGate()
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    final SettingsSoftSignals settings = di.kGetIt<SettingsSoftSignals>();
    final ThemeMode themeMode = settings.themeMode.value;
    final AppFontSize fontSize = settings.fontSize.value;
    final AppFontFamily fontFamily = settings.fontFamily.value;
    final String localeCode = settings.localeCode.value;
    final Locale? locale = localeCode == 'system' ? null : Locale(localeCode);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (BuildContext context) => context.localizations.mainTitle,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      theme: AppTheme.getMaterialTheme(Brightness.light, fontFamily.value, fontSize.multiplier),
      darkTheme: AppTheme.getMaterialTheme(Brightness.dark, fontFamily.value, fontSize.multiplier),
      themeMode: themeMode,
      home: const AuthGate()
    );
  }
}
