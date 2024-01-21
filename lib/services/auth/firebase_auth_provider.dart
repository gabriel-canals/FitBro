import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth, FirebaseAuthException;
import 'package:firebase_core/firebase_core.dart';
import 'package:fitbro/services/auth/auth_provider.dart';
import 'package:fitbro/services/auth/auth_user.dart';
import 'package:fitbro/services/auth/auth_exceptions.dart';

import 'package:fitbro/firebase_options.dart';

/// Firebase Authentication Provider. Adds abstraction to the AuthService
/// to separate back from front.
class FirebaseAuthProvider implements AuthProvider {
  /// New user creation. Requires [email] and [password].
  ///
  /// This will be called the first time a user uses the application.
  @override
  Future<AuthUser> createUser({
    /// Email of the user
    required String email,

    /// Password of the user.
    required String password,

    /// Username of the user.
    required String username,

  }) async {
    try {
      
      if (username.isEmpty || username.length < 4) {
        throw UsernameTooShortAuthException();
      }

      /// Firebase creates the user with the arguments provided.
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Get the user after creation.
      final user = currentUser;

      /// Save username to Firebase.
      await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      
      if (user != null) {
        /// print username
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }
      /// In case any problem occurs, exceptions will be handled.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw InvalidEmailAuthException();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordAuthException();
      } else if (e.code == 'email-already-in-use') {
        throw AlreadyInUseEmailAuthException();
      } else {
        throw GenericAuthException();
      }
    } on UsernameTooShortAuthException catch (_) {
      throw UsernameTooShortAuthException();
    } catch (_) {
      throw GenericAuthException();
    }
  }

  // Gets the current user from the FirebaseProvider if possible.
  @override
  AuthUser? get currentUser {
    final user = FirebaseAuth.instance.currentUser;
    return user != null ? AuthUser.fromFirebase(user) : null;
  }

  /// Logs in a user to their account. Requires [email] and [password].
  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
    try {
      /// Firebase performs the sign in operation with the given arguments
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Get the user after logging in.
      final user = currentUser;
      if (user != null) {
        return user;
      } else {
        throw UserNotLoggedInAuthException();
      }

      /// AuthExceptions will be handled if necessary.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundAuthException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordAuthException();
      } else {
        throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }

  /// Signs out a user from their account.
  @override
  Future<void> logOut() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      /// Firebase performs the sign out operation.
      await FirebaseAuth.instance.signOut();
    } else {
      throw UserNotFoundAuthException();
    }
  }

  /// Sends an email to the user's email to verify their account.
  @override
  Future<void> sendEmailVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.sendEmailVerification();
    } else {
      throw UserNotFoundAuthException();
    }
  }

  /// Initializes the Firebase service.
  @override
  Future<void> initialize() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  
  /// Sends a password reset email if the user requested it.
  @override
  Future<void> sendPasswordReset({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'firebase_auth/user-not-found':
          throw UserNotFoundAuthException();
        case 'firebase_auth/invalid-email':
          throw InvalidEmailAuthException();
        default:
          throw GenericAuthException();
      }
    } catch (_) {
      throw GenericAuthException();
    }
  }
}
