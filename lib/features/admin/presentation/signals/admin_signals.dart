import 'package:signals_flutter/signals_flutter.dart';

enum AdminPage { dashboard, messages, profiles, projects, analytics, settings }

class AdminSignals {
  final Signal<AdminPage> currentPage = signal<AdminPage>(AdminPage.dashboard);
  final Signal<double> sidebarWidth = signal<double>(220);
  final Signal<bool> isSidebarCollapsed = signal<bool>(false);

  static const double minSidebarWidth = 200;
  static const double maxSidebarWidth = 320;

  // Using a method instead of a setter for consistency with other action patterns.
  // ignore: use_setters_to_change_properties
  void selectPage(AdminPage page) {
    currentPage.value = page;
  }

  void resizeSidebar(double delta) {
    sidebarWidth.value = (sidebarWidth.value + delta).clamp(minSidebarWidth, maxSidebarWidth);
  }

  void toggleSidebar() {
    isSidebarCollapsed.value = !isSidebarCollapsed.value;
  }
}
