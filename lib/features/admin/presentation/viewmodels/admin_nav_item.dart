import 'package:developer_website_software/features/admin/presentation/signals/admin_signals.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminNavItem {
  const AdminNavItem({required this.page, required this.label, required this.icon});

  final AdminPage page;
  final String label;
  final IconData icon;

  /// Dashboard
  static const AdminNavItem macosDashboard = AdminNavItem(
    page: AdminPage.dashboard,
    label: 'Dashboard',
    icon: CupertinoIcons.square_grid_2x2,
  );
  static const AdminNavItem materialDashboard = AdminNavItem(
    page: AdminPage.dashboard,
    label: 'Dashboard',
    icon: Icons.dashboard_outlined,
  );
  static const AdminNavItem windowsDashboard = AdminNavItem(
    page: AdminPage.dashboard,
    label: 'Dashboard',
    icon: FluentIcons.view_dashboard,
  );

  /// Messages
  static const AdminNavItem macosMessages = AdminNavItem(
    page: AdminPage.messages,
    label: 'Messages',
    icon: CupertinoIcons.chat_bubble,
  );

  static const AdminNavItem materialMessages = AdminNavItem(
    page: AdminPage.messages,
    label: 'Messages',
    icon: Icons.mail_outline,
  );

  static const AdminNavItem windowsMessages = AdminNavItem(
    page: AdminPage.messages,
    label: 'Messages',
    icon: FluentIcons.message,
  );

  /// Profiles
  static const AdminNavItem macosProfiles = AdminNavItem(
    page: AdminPage.profiles,
    label: 'Profiles',
    icon: CupertinoIcons.person_crop_circle,
  );
  static const AdminNavItem materialProfiles = AdminNavItem(
    page: AdminPage.profiles,
    label: 'Profiles',
    icon: Icons.account_circle_outlined,
  );
  static const AdminNavItem windowsProfiles = AdminNavItem(
    page: AdminPage.profiles,
    label: 'Profiles',
    icon: FluentIcons.contact,
  );

  /// Projects
  static const AdminNavItem macosProjects = AdminNavItem(
    page: AdminPage.projects,
    label: 'Projects',
    icon: CupertinoIcons.folder,
  );
  static const AdminNavItem materialProjects = AdminNavItem(
    page: AdminPage.projects,
    label: 'Projects',
    icon: Icons.folder_special_outlined,
  );
  static const AdminNavItem windowsProjects = AdminNavItem(
    page: AdminPage.projects,
    label: 'Projects',
    icon: FluentIcons.project_collection,
  );

  /// Analytics
  static const AdminNavItem macosAnalytics = AdminNavItem(
    page: AdminPage.analytics,
    label: 'Analytics',
    icon: CupertinoIcons.graph_square,
  );
  static const AdminNavItem materialAnalytics = AdminNavItem(
    page: AdminPage.analytics,
    label: 'Analytics',
    icon: Icons.analytics_outlined,
  );
  static const AdminNavItem windowsAnalytics = AdminNavItem(
    page: AdminPage.analytics,
    label: 'Analytics',
    icon: FluentIcons.equalizer,
  );

  /// Settings
  static const AdminNavItem macosSettings = AdminNavItem(
    page: AdminPage.settings,
    label: 'Settings',
    icon: CupertinoIcons.settings,
  );
  static const AdminNavItem materialSettings = AdminNavItem(
    page: AdminPage.settings,
    label: 'Settings',
    icon: Icons.settings_outlined,
  );
  static const AdminNavItem windowsSettings = AdminNavItem(
    page: AdminPage.settings,
    label: 'Settings',
    icon: FluentIcons.settings,
  );

  static const List<AdminNavItem> macosNavItems = [
    AdminNavItem.macosDashboard,
    AdminNavItem.macosMessages,
    AdminNavItem.macosProfiles,
    AdminNavItem.macosProjects,
    AdminNavItem.macosAnalytics,
    AdminNavItem.macosSettings,
  ];

  static const List<AdminNavItem> materialNavItems = [
    AdminNavItem.materialDashboard,
    AdminNavItem.materialMessages,
    AdminNavItem.materialProfiles,
    AdminNavItem.materialProjects,
    AdminNavItem.materialAnalytics,
    AdminNavItem.materialSettings,
  ];

  static const List<AdminNavItem> windowsNavItems = [
    AdminNavItem.windowsDashboard,
    AdminNavItem.windowsMessages,
    AdminNavItem.windowsProfiles,
    AdminNavItem.windowsProjects,
    AdminNavItem.windowsAnalytics,
    AdminNavItem.windowsSettings,
  ];
}
