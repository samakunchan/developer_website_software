import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_notification_message.dart';
import 'package:developer_website_software/features/authentication/presentation/widgets/authentication_text_field.dart';
import 'package:developer_website_software/features/themes/presentation/buttons_theme.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoLoginScaffold extends StatelessWidget {
  const CupertinoLoginScaffold({
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
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Developer Website Software'),
      ),
      child: SafeArea(
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
                      const Icon(CupertinoIcons.lock_shield, size: 64),
                      const SizedBox(height: 16),
                      Text(
                        'Welcome Back',
                        textAlign: .center,
                        style: CupertinoTheme.of(context).textTheme.navTitleTextStyle.copyWith(fontSize: 28, fontWeight: .bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Authenticate to manage your developer portfolio',
                        textAlign: .center,
                        style: CupertinoTheme.of(context).textTheme.textStyle,
                      ),
                      const SizedBox(height: 32),

                      /// Email Field
                      AuthenticationTextField(
                        title: 'Email Address',
                        controller: emailController,
                        placeholder: 'name@example.com',
                        keyboardType: .emailAddress,
                        childForIcon: const Icon(CupertinoIcons.mail, size: 16)
                      ),
                      const SizedBox(height: 16),

                      /// Password Field
                      AuthenticationTextField(
                        title: 'Password',
                        controller: passwordController,
                        placeholder: '••••••••',
                        obscureText: true,
                        childForIcon: const Icon(CupertinoIcons.lock, size: 16)
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
                        const Center(child: CupertinoActivityIndicator())
                      else if (user != null)
                        CupertinoButton(
                          color: kButtonPrimaryColor,
                          borderRadius: .circular(kButtonBorderRadius),
                          onPressed: onLogoutPressed,
                          child: const Text('Sign Out', style: TextStyle(color: kTextContrastColor)),
                        )
                      else
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: .circular(kButtonBorderRadius),
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
                          child: CupertinoButton(
                            color: kButtonPrimaryColor,
                            borderRadius: .circular(kButtonBorderRadius),
                            onPressed: onLoginPressed,
                            child: const Text('Sign In', style: TextStyle(color: kTextContrastColor)),
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
}
