import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/admin/presentation/screens/admin_screen.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/screens/login_screen.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();

    return SignalBuilder(
      builder: (BuildContext context) {
        final UserEntity? user = authSignals.currentUser.value;
        if (user != null) {
          return const AdminScreen();
        }

        return const LoginScreen();
      },
    );
  }
}
