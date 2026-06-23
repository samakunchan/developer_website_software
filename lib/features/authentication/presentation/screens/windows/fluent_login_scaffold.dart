import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/viewmodels/user_view_model.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_notification_message.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_text_field.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentLoginScaffold extends StatelessWidget {
  const FluentLoginScaffold({
    required this.emailController,
    required this.passwordController,
    required this.authSignals,
    this.onLoginPressed,
    this.onLogoutPressed,
    super.key,
  });
  final AuthSignals authSignals;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onLoginPressed;
  final void Function()? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: const PageHeader(
        title: Text('Developer Website Software'),
      ),
      content: Center(
        child: SizedBox(
          width: 380,
          child: SingleChildScrollView(
            padding: const .all(24),
            child: SignalBuilder(
              builder: (BuildContext context) {
                final bool loading = authSignals.isLoading.value;
                final String? error = authSignals.authError.value;
                final UserViewModel? user = authSignals.currentUser.value;

                return Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .stretch,
                  children: [
                    const Icon(FluentIcons.lock, size: 64),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome Back',
                      textAlign: .center,
                      style: FluentTheme.of(context).typography.title,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Authenticate to manage your developer portfolio',
                      textAlign: .center,
                    ),
                    const SizedBox(height: 32),

                    /// Email Field
                    AuthenticationTextField(
                      title: 'Email Address',
                      controller: emailController,
                      placeholder: 'name@example.com',
                      keyboardType: .emailAddress,
                      childForIcon: const Icon(FluentIcons.mail_options, size: 16)
                    ),
                    const SizedBox(height: 16),

                    /// Password Field
                    AuthenticationTextField(
                      title: 'Password',
                      controller: passwordController,
                      placeholder: '••••••••',
                      obscureText: true,
                      childForIcon: const Icon(FluentIcons.lock, size: 16)
                    ),
                    const SizedBox(height: 24),

                    /// Error message if any
                    if (error != null) ...[
                      AuthenticationNotificationMessage(message: error),
                      const SizedBox(height: 16)
                    ],

                    /// Success User Information
                    if (user != null) ...[
                      AuthenticationNotificationMessage(
                        message: 'Authenticated as: ${user.name} (${user.role})',
                        status: NotificationStatus.success
                      ),

                      const SizedBox(height: 16)
                    ],

                    /// Actions
                    if (loading)
                      const Center(child: ProgressRing())
                    else if (user != null)
                      Button(
                        onPressed: onLogoutPressed,
                        child: const Text('Sign Out'),
                      )
                    else
                      FilledButton(
                        onPressed: onLoginPressed,
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
}
