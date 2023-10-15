import 'package:fitbro/services/auth/auth_user.dart';
import 'package:flutter/foundation.dart' show immutable;

/// Represents the state of the Authentication service.
@immutable
abstract class AuthState {
  final bool isLoading;
  final String? loadingText;
  const AuthState({required this.isLoading, this.loadingText});
}

/// State in case the Authentication service is uninitialized.
class UninitializedAuthState extends AuthState {
  const UninitializedAuthState({required super.isLoading});
}

/// State in case the user is registering to the service.
class RegisteringAuthState extends AuthState {
  final Exception? exception;

  const RegisteringAuthState({
    required super.isLoading,
    required this.exception,
  });
}

/// State in case the user is logged in.
class LoggedInAuthState extends AuthState {
  final AuthUser currentUser;

  const LoggedInAuthState({
    required this.currentUser,
    required super.isLoading,
  });
}

/// State in case the user needs to verify their email.
class NeedsVerificationAuthState extends AuthState {
  const NeedsVerificationAuthState({required super.isLoading});
}

/// State in case the user is not logged in.
class LoggedOutAuthState extends AuthState {
  final Exception? exception;

  const LoggedOutAuthState({
    this.exception,
    required super.isLoading,
    super.loadingText,
  });

  @override
  List<Object?> get props => [exception, isLoading];
}

/// State in case the user forgot their password.
class ForgotPasswordAuthState extends AuthState {
  final Exception? exception;
  final bool hasSentEmail;

  const ForgotPasswordAuthState({
    required super.isLoading,
    required this.hasSentEmail,
    required this.exception,
  });
}
