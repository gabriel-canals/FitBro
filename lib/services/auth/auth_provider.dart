import 'package:fitbro/services/auth/auth_user.dart';

/// Represents an AuthProvider for an AuthService.
///
/// FitBro uses Firebase as Authentication Service.
abstract class AuthProvider {
  /// The current user accessing the app.
  ///
  /// Only one user at every time.
  AuthUser? get currentUser;

  /// The user access to their account.
  Future<AuthUser> logIn({
    required String email,
    required String password,
  });

  /// A new user wants to use the application.
  ///
  /// This will be called the first time they use it.
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });

  /// The user want to get out of the service.
  Future<void> logOut();

  /// Send and email to verify the account of the user if necessary.
  Future<void> sendEmailVerification();

  /// Starts the AuthService.
  Future<void> initialize();

  /// Send an email to restore the user's password.
  Future<void> sendPasswordReset({
    required String email,
  });
}
