import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/core/themes/constantes.dart';
import 'package:developer_website_software/core/themes/input_decoration_theme.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/notification_message.dart';
import 'package:fluent_ui/fluent_ui.dart' as fluent;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as material;
import 'package:signals_flutter/signals_flutter.dart';

class LoginScreen extends PlatformStatefulWidget {
  const LoginScreen({super.key});

  @override
  PlatformState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends PlatformState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthSignals _authSignals = kGetIt<AuthSignals>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressed() async {
    final String email = _emailController.text.trim();
    final String password = _passwordController.text;

    if (email.isNotEmpty && password.isNotEmpty) {
      await _authSignals.signIn(email, password);
    }
  }

  Future<void> _onLogoutPressed() async {
    await _authSignals.signOut();
  }

  @override
  Widget buildCupertino(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Developer Website Software'),
      ),
      child: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = _authSignals.isLoading.value;
                  final String? error = _authSignals.authError.value;
                  final UserEntity? user = _authSignals.currentUser.value;

                  return Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      const Icon(CupertinoIcons.lock_shield, size: 64),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(
                          fontSize: 28,
                          fontWeight: .bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Authenticate to manage your developer portfolio',
                        textAlign: TextAlign.center,
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                      ),
                      const SizedBox(height: 32),

                      /// Email Field
                      const Text('Email Address'),
                      const SizedBox(height: 6),
                      CupertinoTextField(
                        controller: _emailController,
                        placeholder: 'name@example.com',
                        keyboardType: TextInputType.emailAddress,
                        decoration: kCupertinoInputDecoration,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(CupertinoIcons.mail, size: 16),
                        ),
                      ),
                      const SizedBox(height: 16),

                      /// Password Field
                      const Text('Password'),
                      const SizedBox(height: 6),
                      CupertinoTextField(
                        controller: _passwordController,
                        placeholder: '••••••••',
                        obscureText: true,
                        decoration: kCupertinoInputDecoration,
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        prefix: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(CupertinoIcons.lock, size: 16),
                        ),
                      ),
                      const SizedBox(height: 24),

                      /// Error message if any
                      if (error != null) ...[
                        NotificationMessage(message: error),
                        const SizedBox(height: 16),
                      ],

                      /// Success User Information
                      if (user != null) ...[
                        NotificationMessage(
                          message: 'Authenticated as: ${user.name} (${user.role})',
                          status: NotificationStatus.success,
                        ),

                        const SizedBox(height: 16),
                      ],

                      /// Actions
                      if (loading)
                        const Center(child: CupertinoActivityIndicator())
                      else if (user != null)
                        CupertinoButton.filled(
                          onPressed: _onLogoutPressed,
                          child: const Text('Sign Out'),
                        )
                      else
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: CupertinoTheme.of(context).brightness == .dark
                                    ? kPrimaryColor.withValues(alpha: .8)
                                    : kShadowColor.withValues(alpha: .8),
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: CupertinoButton.filled(
                            onPressed: _onLoginPressed,
                            child: const Text('Sign In'),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return fluent.ScaffoldPage(
      header: const fluent.PageHeader(
        title: Text('Developer Website Software'),
      ),
      content: Center(
        child: SizedBox(
          width: 380,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: SignalBuilder(
              builder: (BuildContext context) {
                final bool loading = _authSignals.isLoading.value;
                final String? error = _authSignals.authError.value;
                final UserEntity? user = _authSignals.currentUser.value;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Icon(CupertinoIcons.lock_shield, size: 64, color: CupertinoColors.activeBlue),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome Back',
                      textAlign: TextAlign.center,
                      style: fluent.FluentTheme.of(context).typography.title,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Authenticate to manage your developer portfolio',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),

                    // Email Field
                    fluent.InfoLabel(
                      label: 'Email Address',
                      child: fluent.TextBox(
                        controller: _emailController,
                        placeholder: 'name@example.com',
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Password Field
                    fluent.InfoLabel(
                      label: 'Password',
                      child: fluent.TextBox(
                        controller: _passwordController,
                        placeholder: '••••••••',
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Error message if any
                    if (error != null) ...[
                      fluent.InfoBar(
                        title: const Text('Error'),
                        content: Text(error),
                        severity: fluent.InfoBarSeverity.error,
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Success User Information
                    if (user != null) ...[
                      fluent.InfoBar(
                        title: const Text('Success'),
                        content: Text('Authenticated as: ${user.name} (${user.role})'),
                        severity: fluent.InfoBarSeverity.success,
                      ),
                      const SizedBox(height: 16),
                    ],

                    // Actions
                    if (loading)
                      const Center(child: fluent.ProgressRing())
                    else if (user != null)
                      fluent.Button(
                        onPressed: _onLogoutPressed,
                        child: const Text('Sign Out'),
                      )
                    else
                      fluent.FilledButton(
                        onPressed: _onLoginPressed,
                        child: const Text('Sign In'),
                      ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return material.Scaffold(
      appBar: material.AppBar(
        title: const Text('Developer Website Software'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = _authSignals.isLoading.value;
                  final String? error = _authSignals.authError.value;
                  final UserEntity? user = _authSignals.currentUser.value;

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(CupertinoIcons.lock_shield, size: 64, color: CupertinoColors.activeBlue),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        textAlign: TextAlign.center,
                        style: material.Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Authenticate to manage your developer portfolio',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: material.Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Email Field
                      material.TextField(
                        controller: _emailController,
                        decoration: const material.InputDecoration(
                          labelText: 'Email Address',
                          hintText: 'name@example.com',
                          prefixIcon: Icon(CupertinoIcons.mail),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),

                      // Password Field
                      material.TextField(
                        controller: _passwordController,
                        decoration: const material.InputDecoration(
                          labelText: 'Password',
                          hintText: '••••••••',
                          prefixIcon: Icon(CupertinoIcons.lock),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 24),

                      // Error message if any
                      if (error != null) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: material.Theme.of(context).colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(material.Icons.error, color: material.Theme.of(context).colorScheme.error),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  error,
                                  style: TextStyle(color: material.Theme.of(context).colorScheme.onErrorContainer),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Success User Information
                      if (user != null) ...[
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: material.Colors.green.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: material.Colors.green),
                          ),
                          child: Text(
                            'Authenticated as: ${user.name} (${user.role})',
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: material.Colors.green),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Actions
                      if (loading)
                        const Center(child: material.CircularProgressIndicator())
                      else if (user != null)
                        material.FilledButton(
                          onPressed: _onLogoutPressed,
                          child: const Text('Sign Out'),
                        )
                      else
                        material.FilledButton(
                          onPressed: _onLoginPressed,
                          child: const Text('Sign In'),
                        ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
