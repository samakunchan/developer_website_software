import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/features/authentication/domain/entities/user_entity.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/themes/presentation/light_theme_constants.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:signals_flutter/signals_flutter.dart';

class FluentAdminToolbar extends StatelessWidget {
  const FluentAdminToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();
    final FluentThemeData theme = FluentTheme.of(context);
    final bool isDark = theme.brightness == .dark;

    final Color primaryColor = theme.accentColor;
    final Color sidebarBorder = isDark ? const Color(0xFF1E293B) : LightThemeConstants.glassBorder;

    return Container(
      padding: const .symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: sidebarBorder)),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          /// Search Box
          const SizedBox(
            width: 240,
            child: TextBox(
              placeholder: 'Search...',
              prefix: Padding(padding: .only(left: 8), child: Icon(FluentIcons.search, size: 14)),
            ),
          ),

          /// Actions
          Row(
            spacing: 12,
            children: [
              IconButton(icon: const Icon(FluentIcons.home, size: 16), onPressed: () {}),
              IconButton(icon: const Icon(FluentIcons.ringer, size: 16), onPressed: () {}),
              IconButton(icon: const Icon(FluentIcons.all_apps, size: 16), onPressed: () {}),
              ColoredBox(color: sidebarBorder, child: const SizedBox(width: 1, height: 16)),

              /// User info
              SignalBuilder(
                builder: (BuildContext context) {
                  final UserEntity? user = authSignals.currentUser.value;
                  final String name = user?.name ?? 'Alex Dev';
                  final String initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

                  return Row(
                    spacing: 8,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: .w500, color: isDark ? Colors.white : Colors.black),
                      ),
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(color: primaryColor, shape: .circle),
                        child: Center(
                          child: Text(
                            initial,
                            style: const TextStyle(color: Colors.white, fontWeight: .bold, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
