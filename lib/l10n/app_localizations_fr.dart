// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get mainTitle => 'Logiciel de site de développeur';

  @override
  String get dashboard => 'Tableau de bord';

  @override
  String get messages => 'Messages';

  @override
  String get profiles => 'Profils';

  @override
  String get projects => 'Projets';

  @override
  String get analytics => 'Analytiques';

  @override
  String get settings => 'Paramètres';

  @override
  String get logout => 'Déconnexion';

  @override
  String get searchPlaceholder => 'Rechercher...';

  @override
  String get languageLabel => 'Langue';

  @override
  String get systemLanguageOption => 'Auto.';

  @override
  String get englishOption => 'English';

  @override
  String get frenchOption => 'Français';

  @override
  String get spanishOption => 'Español';

  @override
  String get preferencesTitle => 'Préférences';

  @override
  String get generalTab => 'Général';

  @override
  String get accountInfoTab => 'Informations du compte';

  @override
  String get closeButton => 'Fermer';

  @override
  String get appearanceLabel => 'Apparence';

  @override
  String get themeSystem => 'Système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get fontSizeLabel => 'Taille de police';

  @override
  String get fontSizeSmall => 'Petit';

  @override
  String get fontSizeMedium => 'Moyen';

  @override
  String get fontSizeLarge => 'Grand';

  @override
  String get fontFamilyLabel => 'Famille de polices';

  @override
  String get notAuthenticated => 'Non authentifié';

  @override
  String get authHelpText => 'Veuillez vous connecter à l\'application pour voir les détails de votre compte développeur.';

  @override
  String get accountIdLabel => 'Identifiant du compte';

  @override
  String get emailAddressLabel => 'Adresse e-mail';

  @override
  String get welcomeBack => 'Bon retour';

  @override
  String get authSubtitle => 'Authentifiez-vous pour gérer votre portfolio de développeur';

  @override
  String get emailPlaceholder => 'nom@exemple.com';

  @override
  String get passwordLabel => 'Mot de passe';

  @override
  String authenticatedAs(String name, String role) {
    return 'Authentifié en tant que : $name ($role)';
  }

  @override
  String get signInButton => 'Se connecter';

  @override
  String get signOutButton => 'Se déconnecter';
}
