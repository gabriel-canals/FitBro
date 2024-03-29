import 'package:fitbro/services/auth/firebase_auth_provider.dart';
import 'package:fitbro/services/auth/auth_provider.dart';
import 'package:fitbro/services/auth/auth_user.dart';

/// FitBro's Authenticantion Service.
///
/// Uses Firebase as provider, connected via the AuthProvider class.
class AuthService implements AuthProvider {
  /// Generate the provider for this.
  final AuthProvider provider;
  const AuthService(this.provider);

  /// Set the AuthService to use Firebase as provider.
  factory AuthService.firebase() => AuthService(FirebaseAuthProvider());

  /// The provider creates a new user. Requires [email] and [password].
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String username,
  }) =>
      provider.createUser(
        email: email,
        password: password,
        username: username,
      );

  /// Gets the currents user from the provider.
  @override
  AuthUser? get currentUser => provider.currentUser;

  /// The provider logs in a user. Requires [email] and [password].
  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(
        email: email,
        password: password,
      );

  /// The provider logs out the current user.
  @override
  Future<void> logOut() => provider.logOut();

  /// The provider send a verification email to the user.
  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();

  /// The provider initializes the Authentication Service.
  @override
  Future<void> initialize() => provider.initialize();

  /// The provider will send a Password Reset email to the user if needed.
  @override
  Future<void> sendPasswordReset({required String email}) => provider.sendPasswordReset(email: email);
  
  @override
  Future<void> changeUsername({required String username}) => provider.changeUsername(username: username);
  
}
