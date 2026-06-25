import 'package:developer_website_software/core/extensions/build_context_extension.dart';
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
    super.key
  });

  final AuthSignals authSignals;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onLoginPressed;
  final void Function()? onLogoutPressed;

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(
      header: PageHeader(
        title: Text(context.localizations.mainTitle)
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
                      context.localizations.welcomeBack,
                      textAlign: .center,
                      style: FluentTheme.of(context).typography.title
                    ),
                    const SizedBox(height: 8),
                    Text(
                      context.localizations.authSubtitle,
                      textAlign: .center
                    ),
                    const SizedBox(height: 32),

                    /// Email Field
                    AuthenticationTextField(
                      title: context.localizations.emailAddressLabel,
                      controller: emailController,
                      placeholder: context.localizations.emailPlaceholder,
                      keyboardType: .emailAddress,
                      childForIcon: const Icon(FluentIcons.mail_options, size: 16)
                    ),
                    const SizedBox(height: 16),

                    /// Password Field
                    AuthenticationTextField(
                      title: context.localizations.passwordLabel,
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
                        message: context.localizations.authenticatedAs(user.name, user.role),
                        status: .success
                      ),
                      const SizedBox(height: 16)
                    ],

                    /// Actions
                    if (loading)
                      const Center(child: ProgressRing())
                    else if (user != null)
                      Button(
                        onPressed: onLogoutPressed,
                        child: Text(context.localizations.signOutButton)
                      )
                    else
                      FilledButton(
                        onPressed: onLoginPressed,
                        child: Text(context.localizations.signInButton)
                      )
                  ]
                );
              }
            )
          )
        )
      )
    );
  }
}
