import 'package:flutter/foundation.dart' show immutable;

/// Represents BLoC event regarding the Authentication service.
@immutable
abstract class AuthEvent {
  const AuthEvent();
}

/// Event for the initialization of the Authentication service.
class InitializeAuthEvent extends AuthEvent {
  const InitializeAuthEvent();
}

/// Event for logging in users.
class LogInAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const LogInAuthEvent(
    this.email,
    this.password,
  );
}

/// Event for registering users.
class CreateUserAuthEvent extends AuthEvent {
  final String email;
  final String password;

  const CreateUserAuthEvent(
    this.email,
    this.password,
  );
}

/// Event in case the user forgot their password.
class ForgottenPasswordAuthEvent extends AuthEvent {
  final String? email;
  const ForgottenPasswordAuthEvent(
    this.email,
  );
}

/// Event in case the user wants to log out.
class LogOutAuthEvent extends AuthEvent {
  const LogOutAuthEvent();
}

/// Event in case the user needs to verify their email.
class EmailVerificationAuthEvent extends AuthEvent {
  const EmailVerificationAuthEvent();
}

/// Event in case the user should be registered.
class ShouldRegisterAuthEvent extends AuthEvent {
  const ShouldRegisterAuthEvent();
}
