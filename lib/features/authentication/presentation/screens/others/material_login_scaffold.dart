import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_text_field.dart';
import 'package:fluent_ui/fluent_ui.dart' hide Colors;
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialLoginScaffold extends StatelessWidget {
  const MaterialLoginScaffold({
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Website Software'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 380,
            child: SingleChildScrollView(
              padding: const .all(24),
              child: SignalBuilder(
                builder: (BuildContext context) {
                  final bool loading = authSignals.isLoading.value;
                  final String? error = authSignals.authError.value;
                  final UserEntity? user = authSignals.currentUser.value;

                  return Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .stretch,
                    children: [
                      const Icon(Icons.lock, size: 64),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        textAlign: .center,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: .bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Authenticate to manage your developer portfolio',
                        textAlign: .center,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 32),

                      /// Email Field
                      AuthenticationTextField(
                        title: 'Email Address',
                        controller: emailController,
                        placeholder: 'name@example.com',
                        keyboardType: .emailAddress,
                        childForIcon: const Icon(FluentIcons.mail_options, size: 16),
                      ),
                      const SizedBox(height: 16),

                      /// Password Field
                      AuthenticationTextField(
                        title: 'Password',
                        controller: passwordController,
                        placeholder: '••••••••',
                        obscureText: true,
                        childForIcon: const Icon(FluentIcons.lock, size: 16),
                      ),
                      const SizedBox(height: 24),

                      // Error message if any
                      if (error != null) ...[
                        Container(
                          padding: const .all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.errorContainer,
                            borderRadius: .circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error, color: Theme.of(context).colorScheme.error),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Text(
                                  error,
                                  style: TextStyle(color: Theme.of(context).colorScheme.onErrorContainer),
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
                          padding: const .all(12),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.15),
                            borderRadius: .circular(8),
                            border: .all(color: Colors.green),
                          ),
                          child: Text(
                            'Authenticated as: ${user.name} (${user.role})',
                            textAlign: .center,
                            style: const TextStyle(color: Colors.green),
                          ),
                        ),
                        const SizedBox(height: 16),
                      ],

                      // Actions
                      if (loading)
                        const Center(child: CircularProgressIndicator())
                      else if (user != null)
                        ElevatedButton(
                          onPressed: onLogoutPressed,
                          child: const Text('Sign Out'),
                        )
                      else
                        ElevatedButton(
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
      ),
    );
  }
}
