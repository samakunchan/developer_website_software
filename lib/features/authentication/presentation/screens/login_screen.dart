import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('Developer Website Software'),
      ),
      children: [
        ContentArea(
          builder: (BuildContext context, ScrollController scrollController) {
            return Center(
              child: SizedBox(
                width: 380,
                child: SingleChildScrollView(
                  controller: scrollController,
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
                          const Icon(CupertinoIcons.lock_shield, size: 64, color: CupertinoColors.activeBlue),
                          const SizedBox(height: 16),
                          Text(
                            'Welcome Back',
                            textAlign: .center,
                            style: MacosTheme.of(context).typography.title1.copyWith(fontWeight: .bold),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Authenticate to manage your developer portfolio',
                            textAlign: .center,
                            style: MacosTheme.of(context).typography.headline.copyWith(color: CupertinoColors.secondaryLabel),
                          ),
                          const SizedBox(height: 32),

                          // Email Field
                          const Text('Email Address'),
                          const SizedBox(height: 6),
                          MacosTextField(
                            controller: _emailController,
                            placeholder: 'name@example.com',
                            keyboardType: .emailAddress,
                            prefix: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                CupertinoIcons.mail,
                                size: 16,
                                color: CupertinoColors.secondaryLabel,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Password Field
                          const Text('Password'),
                          const SizedBox(height: 6),
                          MacosTextField(
                            controller: _passwordController,
                            placeholder: '••••••••',
                            obscureText: true,
                            prefix: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Icon(
                                CupertinoIcons.lock,
                                size: 16,
                                color: CupertinoColors.secondaryLabel,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),

                          // Error message if any
                          if (error != null) ...[
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: MacosTheme.of(context).brightness.isDark
                                    ? const Color(0x33FF4A4A)
                                    : const Color(0xFFFFECEC),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: CupertinoColors.systemRed.withValues(alpha: 0.5),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    CupertinoIcons.exclamationmark_triangle_fill,
                                    color: CupertinoColors.systemRed,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                      error,
                                      style: MacosTheme.of(context).typography.body.copyWith(
                                        color: CupertinoColors.systemRed,
                                      ),
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
                                color: CupertinoColors.activeGreen.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: CupertinoColors.activeGreen.withValues(alpha: 0.5),
                                ),
                              ),
                              child: Text(
                                'Authenticated as: ${user.name} (${user.role})',
                                textAlign: .center,
                                style: MacosTheme.of(context).typography.body.copyWith(
                                  color: CupertinoColors.activeGreen,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],

                          // Actions
                          if (loading)
                            const Center(
                              child: ProgressCircle(),
                            )
                          else
                            PushButton(
                              controlSize: ControlSize.large,
                              onPressed: _onLoginPressed,
                              child: const Text('Sign In'),
                            ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
