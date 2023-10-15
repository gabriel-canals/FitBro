import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

/// Represents a User in Firebase.
@immutable
class AuthUser {
  /// A unique identifier for the user.
  final String uid;

  /// Whether the user has their email verified.
  final bool isEmailVerified;

  /// Email of the user.
  final String email;

  /// Creates an instance of a user.
  const AuthUser({
    required this.uid,
    required this.isEmailVerified,
    required this.email,
  });

  /// Copy constructor for users from the Firebase service.
  factory AuthUser.fromFirebase(User user) => AuthUser(
        uid: user.uid,
        isEmailVerified: user.emailVerified,
        email: user.email!,
      );
}
