/// In case the user is not found on the Firebase system
class UserNotFoundAuthException implements Exception {}

/// The user inserted the wrong password
class WrongPasswordAuthException implements Exception {}

/// The user inserted an invalid email
class InvalidEmailAuthException implements Exception {}

/// The user inserted an email that is currently in use by another user
class AlreadyInUseEmailAuthException implements Exception {}

/// Password provided by the user is not strong enough
class WeakPasswordAuthException implements Exception {}

/// An error occurred during the AuthService performance
class GenericAuthException implements Exception {}

/// The information should not appear if the user is not logged in
class UserNotLoggedInAuthException implements Exception {}