// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get mainTitle => 'Software de sitio web de desarrollador';

  @override
  String get dashboard => 'Tablero';

  @override
  String get messages => 'Mensajes';

  @override
  String get profiles => 'Perfiles';

  @override
  String get projects => 'Proyectos';

  @override
  String get analytics => 'Analítica';

  @override
  String get settings => 'Configuración';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get searchPlaceholder => 'Buscar...';

  @override
  String get languageLabel => 'Idioma';

  @override
  String get systemLanguageOption => 'Auto.';

  @override
  String get englishOption => 'English';

  @override
  String get frenchOption => 'Français';

  @override
  String get spanishOption => 'Español';

  @override
  String get preferencesTitle => 'Preferencias';

  @override
  String get generalTab => 'General';

  @override
  String get accountInfoTab => 'Información de la cuenta';

  @override
  String get closeButton => 'Cerrar';

  @override
  String get appearanceLabel => 'Apariencia';

  @override
  String get themeSystem => 'Sistema';

  @override
  String get themeLight => 'Claro';

  @override
  String get themeDark => 'Oscuro';

  @override
  String get fontSizeLabel => 'Tamaño de fuente';

  @override
  String get fontSizeSmall => 'Pequeño';

  @override
  String get fontSizeMedium => 'Mediano';

  @override
  String get fontSizeLarge => 'Grande';

  @override
  String get fontFamilyLabel => 'Familia de fuentes';

  @override
  String get notAuthenticated => 'No autenticado';

  @override
  String get authHelpText => 'Inicie sesión en la aplicación para ver los detalles de su cuenta de desarrollador.';

  @override
  String get accountIdLabel => 'ID de la cuenta';

  @override
  String get emailAddressLabel => 'Dirección de correo electrónico';

  @override
  String get welcomeBack => 'Bienvenido de nuevo';

  @override
  String get authSubtitle => 'Autentíquese para administrar su portafolio de desarrollador';

  @override
  String get emailPlaceholder => 'nombre@ejemplo.com';

  @override
  String get passwordLabel => 'Contraseña';

  @override
  String authenticatedAs(String name, String role) {
    return 'Autenticado como: $name ($role)';
  }

  @override
  String get signInButton => 'Iniciar sesión';

  @override
  String get signOutButton => 'Cerrar sesión';
}
