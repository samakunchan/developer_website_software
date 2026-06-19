import 'package:developer_website_software/l10n/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextExtension on BuildContext {
  /// Convenient accessor for standard [AppLocalizations] instance
  AppLocalizations get localizations => AppLocalizations.of(this)!;

  /// Fallback alias for convenience (e.g. context.localization.title)
  AppLocalizations get localization => AppLocalizations.of(this)!;
}
