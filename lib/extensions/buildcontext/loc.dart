import 'package:flutter/material.dart' show BuildContext;
import 'package:flutter_gen/gen_l10n/app_localizations.dart' show AppLocalizations;

/// Localization messages will be accessed by loc.
extension Localization on BuildContext {
  AppLocalizations get loc => AppLocalizations.of(this);
}