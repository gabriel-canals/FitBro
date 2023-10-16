import 'package:flutter/foundation.dart' show immutable;

typedef CloseLoadingScreen = bool Function();

typedef UpdateLoadingScreen = bool Function(String text);

/// Controller for the loading screen.
/// 
/// This will manage when the loadings screen shows and hides.
@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}