import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';

class MaterialAdminToolbar extends StatelessWidget {
  const MaterialAdminToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.colorScheme.primary;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Container(
      padding: const .symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: sidebarBorder))
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          /// Search Bar
          SizedBox(
            width: 240,
            height: 40,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search, size: 20),
                border: OutlineInputBorder(borderRadius: .circular(8)),
                contentPadding: .zero
              )
            )
          ),

          /// Actions
          Row(
            spacing: 12,
            children: [
              IconButton(icon: const Icon(Icons.home_outlined), onPressed: () {}),
              IconButton(icon: const Icon(Icons.notifications_none_outlined), onPressed: () {}),
              IconButton(icon: const Icon(Icons.apps_outlined), onPressed: () {}),
              ColoredBox(color: sidebarBorder, child: const SizedBox(width: 1, height: 20)),

              /// User Avatar and Name
              SignalBuilder(
                builder: (BuildContext context) {
                  final UserEntity? user = authSignals.currentUser.value;
                  final String name = user?.name ?? 'Alex Dev';
                  final String initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

                  return Row(
                    spacing: 8,
                    children: [
                      Text(name, style: const TextStyle(fontWeight: .bold)),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: primaryColor,
                        child: Text(
                          initial,
                          style: const TextStyle(color: Colors.white, fontWeight: .bold, fontSize: 12)
                        )
                      )
                    ]
                  );
                }
              )
            ]
          )
        ]
      )
    );
  }
}
