// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get mainTitle => 'Developer Website Software';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get messages => 'Messages';

  @override
  String get profiles => 'Profiles';

  @override
  String get projects => 'Projects';

  @override
  String get analytics => 'Analytics';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Logout';

  @override
  String get searchPlaceholder => 'Search...';

  @override
  String get languageLabel => 'Language';

  @override
  String get systemLanguageOption => 'Auto.';

  @override
  String get englishOption => 'English';

  @override
  String get frenchOption => 'Français';

  @override
  String get spanishOption => 'Español';

  @override
  String get preferencesTitle => 'Preferences';

  @override
  String get generalTab => 'General';

  @override
  String get accountInfoTab => 'Account Info';

  @override
  String get closeButton => 'Close';

  @override
  String get appearanceLabel => 'Appearance';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get fontSizeLabel => 'Font Size';

  @override
  String get fontSizeSmall => 'Small';

  @override
  String get fontSizeMedium => 'Medium';

  @override
  String get fontSizeLarge => 'Large';

  @override
  String get fontFamilyLabel => 'Font Family';

  @override
  String get notAuthenticated => 'Not Authenticated';

  @override
  String get authHelpText => 'Please sign in to the application to view your developer account details.';

  @override
  String get accountIdLabel => 'Account ID';

  @override
  String get emailAddressLabel => 'Email Address';

  @override
  String get welcomeBack => 'Welcome Back';

  @override
  String get authSubtitle => 'Authenticate to manage your developer portfolio';

  @override
  String get emailPlaceholder => 'name@example.com';

  @override
  String get passwordLabel => 'Password';

  @override
  String authenticatedAs(String name, String role) {
    return 'Authenticated as: $name ($role)';
  }

  @override
  String get signInButton => 'Sign In';

  @override
  String get signOutButton => 'Sign Out';
}
