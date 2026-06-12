import 'package:developer_website_software/core/cross_platform/platform_stateful_widget.dart';
import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/presentation/screens/macos/cupertino_login_scaffold.dart';
import 'package:developer_website_software/features/authentication/presentation/screens/others/material_login_scaffold.dart';
import 'package:developer_website_software/features/authentication/presentation/screens/windows/fluent_login_scaffold.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:flutter/cupertino.dart';

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
    return CupertinoLoginScaffold(
      emailController: _emailController,
      passwordController: _passwordController,
      authSignals: _authSignals,
      onLoginPressed: _onLoginPressed,
      onLogoutPressed: _onLogoutPressed,
    );
  }

  @override
  Widget buildFluent(BuildContext context) {
    return FluentLoginScaffold(
      emailController: _emailController,
      passwordController: _passwordController,
      authSignals: _authSignals,
      onLoginPressed: _onLoginPressed,
      onLogoutPressed: _onLogoutPressed,
    );
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return MaterialLoginScaffold(
      emailController: _emailController,
      passwordController: _passwordController,
      authSignals: _authSignals,
      onLoginPressed: _onLoginPressed,
      onLogoutPressed: _onLogoutPressed,
    );
  }
}
