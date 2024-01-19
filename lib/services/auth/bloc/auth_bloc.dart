import 'package:bloc/bloc.dart';
import 'package:fitbro/services/auth/auth_provider.dart';
import 'package:fitbro/services/auth/bloc/auth_event.dart';
import 'package:fitbro/services/auth/bloc/auth_state.dart';

/// FitBro uses BLoC to control the Authentication service.
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(AuthProvider provider)
      : super(const UninitializedAuthState(
          /// In case the app is loading a view.
          isLoading: true,
        )) {
    /// If an email verification is needed.
    on<EmailVerificationAuthEvent>((event, emit) async {
      await provider.sendEmailVerification();
      emit(state);
    });

    /// In case a user forgot their password
    on<ForgottenPasswordAuthEvent>((event, emit) async {
      /// Forgotten password
      emit(const ForgotPasswordAuthState(
        isLoading: false,
        hasSentEmail: false,
        exception: null,
      ));
      final email = event.email;
      if (email == null) return;

      /// Loading after forgetting password
      emit(const ForgotPasswordAuthState(
        isLoading: true,
        hasSentEmail: false,
        exception: null,
      ));
      bool hasSentEmail;
      Exception? exception;
      try {
        /// Provider sends the Password Reset email.
        await provider.sendPasswordReset(
          email: email,
        );
        hasSentEmail = true;
        exception = null;
      } on Exception catch (e) {
        hasSentEmail = false;
        exception = e;
      }

      /// The Restore Password email has been sent.
      emit(ForgotPasswordAuthState(
        isLoading: false,
        hasSentEmail: hasSentEmail,
        exception: exception,
      ));
    });

    /// In case a new user wants to create an account.
    on<CreateUserAuthEvent>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final username = event.username;
      try {
        /// Provider creates the user.
        await provider.createUser(
          email: email,
          password: password,
          username: username,
        );

        /// Send email verification.
        await provider.sendEmailVerification();
        emit(const NeedsVerificationAuthState(isLoading: false));
      } on Exception catch (e) {
        /// In case any problem occurs during user creation.
        emit(RegisteringAuthState(
          isLoading: false,
          exception: e,
        ));
      }
    });

    /// If the Authentication service need to be initialized.
    on<InitializeAuthEvent>((event, emit) async {
      await provider.initialize();
      final user = provider.currentUser;

      /// Checks whether the current user is valid.
      if (user == null) {
        emit(const LoggedOutAuthState(
          isLoading: false,
        ));
      } else if (!user.isEmailVerified) {
        emit(const NeedsVerificationAuthState(
          isLoading: false,
        ));
      } else {
        emit(LoggedInAuthState(
          currentUser: user,
          isLoading: false,
        ));
      }
    });

    /// A user is tries to log in.
    on<LogInAuthEvent>((event, emit) async {
      emit(const LoggedOutAuthState(
        isLoading: false,
      ));

      /// Gets the current email and password.
      final email = event.email;
      final password = event.password;
      try {
        /// Provider logs in the user.
        final user = await provider.logIn(
          email: email,
          password: password,
        );

        /// Verify the email if necessary.
        if (!user.isEmailVerified) {
          emit(const LoggedOutAuthState(
            isLoading: false,
          ));
          emit(const NeedsVerificationAuthState(
            isLoading: false,
          ));
        } else {
          emit(const LoggedOutAuthState(
            isLoading: false,
          ));
          emit(LoggedInAuthState(
            currentUser: user,
            isLoading: false,
          ));
        }

        /// User logged in.
        emit(LoggedInAuthState(
          currentUser: user,
          isLoading: false,
        ));
      } on Exception catch (e) {
        /// Manage exceptions if needed.
        emit(LoggedOutAuthState(
          isLoading: false,
          exception: e,
        ));
      }
    });

    /// A user is tries to log out.
    on<LogOutAuthEvent>((event, emit) async {
      try {
        await provider.logOut();
        emit(const LoggedOutAuthState(
          isLoading: false,
        ));
      } on Exception catch (e) {
        emit(LoggedOutAuthState(
          isLoading: false,
          exception: e,
        ));
      }
    });

    /// A user does not have an account yet.
    on<ShouldRegisterAuthEvent>((event, emit) async {
      emit(
        const RegisteringAuthState(
          exception: null,
          isLoading: false,
        ),
      );
    });

    /// A user wants to register.
    on<RegisterAuthEvent>((event, emit) async {
      final email = event.email;
      final password = event.password;
      final username = event.username;
      try {
        await provider.createUser(
          email: email,
          password: password,
          username: username,
        );
        await provider.sendEmailVerification();
        emit(const NeedsVerificationAuthState(isLoading: false));
      } on Exception catch (e) {
        emit(RegisteringAuthState(
          isLoading: false,
          exception: e,
        ));
      }
    });
  }
}
