import 'package:flutter_test/flutter_test.dart';
import 'package:fitbro/services/auth/auth_exceptions.dart';
import 'package:fitbro/services/auth/auth_provider.dart';
import 'package:fitbro/services/auth/auth_user.dart';

/// Test FitBro's Authentication Service
void main() {
  group("Mock Authentication", () {
    final provider = MockAuthProvider();

    /// Tests the isInitialized work.
    test('Should not be initialized to begin with', () {
      expect(
        provider.isInitialized,
        false,
      );
    });

    /// Tests whether the user can log out with the service uninitialized.
    test('Not log out if not initialized', () {
      expect(
        provider.logOut(),
        throwsA(
          const TypeMatcher<NotInitializedException>(),
        ),
      );
    });

    /// Tests the initialize function.
    test('Should be able to be initialized', () async {
      await provider.initialize();
      expect(
        provider._isInitialized,
        true,
      );
    });

    /// Tests whether the user var gets some value after initialization.
    test('User should be null after initialization', () {
      expect(
        provider.currentUser,
        null,
      );
    });

    /// Tests the timeout for the service initialization.
    test(
      'Should be able to initialize in less than 2 seconds',
      () async {
        await provider.initialize();
        expect(
          provider._isInitialized,
          true,
        );
      },
      timeout: const Timeout(Duration(seconds: 2)),
    );

    /// Tests the createUser and the logIn functions.
    test('Create User should delegate to logIn function', () async {
      final badEmail = provider.createUser(
        email: 'foo@bar.com',
        password: '1234567',
        username: 'foo',
      );
      expect(
        badEmail,
        throwsA(const TypeMatcher<UserNotFoundAuthException>()),
      );

      final badPasswd = provider.createUser(
        email: 'gabriel@canals.com',
        password: 'canals',
        username: 'gabriel',
      );
      expect(
        badPasswd,
        throwsA(const TypeMatcher<WrongPasswordAuthException>()),
      );

      final validUser = await provider.createUser(
        email: 'gabriel@canals.com',
        password: 'c4n41\$',
        username: 'gabriel',
      );
      expect(provider.currentUser, validUser);
      expect(validUser.isEmailVerified, false);
    });

    /// Tests the sendEmailVerification function.
    test('Logged user should be able to get verified', () async {
      provider.sendEmailVerification();
      final user = provider.currentUser;
      expect(user, isNotNull);
      expect(user!.isEmailVerified, true);
    });

    /// Tests the logOut and the logIn functions.
    test('Should be able to log out and log in again', () async {
      await provider.logOut();
      await provider.logIn(
        email: 'gabriel',
        password: 'password',
      );
      final user = provider.currentUser;
      expect(user, isNotNull);
    });
  });
}

/// In case the service is not initialized.
class NotInitializedException implements Exception {}

/// Overrides the AuthProvider class for testing purposes.
class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
    required String username,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    if (email == 'foo@bar.com') throw UserNotFoundAuthException();
    if (password == 'canals') throw WrongPasswordAuthException();
    const user = AuthUser(
      uid: '007',
      isEmailVerified: false,
      email: 'foo@bar.com',
    );
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logOut() async {
    if (!isInitialized) throw NotInitializedException();
    if (_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser(
      uid: '007',
      isEmailVerified: true,
      email: 'foo@bar.com',
    );
    _user = newUser;
  }

  @override
  Future<void> initialize() async {
    await Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }
  
  @override
  Future<void> sendPasswordReset({required String email}) {
    throw UnimplementedError();
  }
}
