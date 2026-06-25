import 'package:developer_website_software/core/di/injection_container.dart';
import 'package:developer_website_software/core/extensions/build_context_extension.dart';
import 'package:developer_website_software/features/authentication/presentation/signals/auth_signals.dart';
import 'package:developer_website_software/features/authentication/presentation/viewmodels/user_view_model.dart';
import 'package:developer_website_software/features/themes/presentation/constantes.dart';
import 'package:flutter/cupertino.dart';
import 'package:signals_flutter/signals_flutter.dart';

class CupertinoAdminToolbar extends StatelessWidget {
  const CupertinoAdminToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthSignals authSignals = kGetIt<AuthSignals>();

    return Container(
      padding: const .symmetric(horizontal: 20, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: kSidebarBorderColor)),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          /// Search bar
          Expanded(flex: 2, child: CupertinoSearchTextField(placeholder: context.localizations.searchPlaceholder)),

          /// Actions
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: .end,
              spacing: 12,
              children: [
                CupertinoButton(padding: .zero, onPressed: () {}, child: const Icon(CupertinoIcons.home, size: 20)),
                CupertinoButton(padding: .zero, onPressed: () {}, child: const Icon(CupertinoIcons.bell, size: 20)),
                CupertinoButton(padding: .zero, onPressed: () {}, child: const Icon(CupertinoIcons.square_grid_2x2, size: 20)),
                const ColoredBox(color: kSidebarBorderColor, child: SizedBox(width: 1, height: 20)),

                /// User Avatar and Name
                SignalBuilder(
                  builder: (BuildContext context) {
                    final UserViewModel? user = authSignals.currentUser.value;
                    final String name = user?.name ?? 'Alex Dev';
                    final String initial = name.isNotEmpty ? name[0].toUpperCase() : 'A';

                    return Row(
                      spacing: 8,
                      children: [
                        Text(name),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(color: kPrimaryColor, shape: .circle),
                          child: Center(
                            child: Text(
                              initial,
                              style: const TextStyle(color: CupertinoColors.white, fontWeight: .bold, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
