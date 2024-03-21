import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medicine_reminder_app/data_layer/data_layer.dart';
import 'package:medicine_reminder_app/service/supabase_services.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final serviceLocator = DataInjection().locator.get<DBServices>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpEvent>(signUpNewUser);
    on<LoginEvent>(login);
    on<CheckSessionAvailability>(getSession);
    on<LogoutEvent>(logout);
    on<ResendOtpEvent>(resendOtp);
    on<SendOtpEvent>(sendOtp);
    on<ConfirmOtpEvent>(confirmOtp);
    on<ChangePasswordEvent>(updatePassword);
  }

  FutureOr<void> signUpNewUser(
      SignUpEvent event, Emitter<AuthState> emit) async {
    if (event.email.trim().isNotEmpty &&
        event.password.trim().isNotEmpty &&
        event.name.trim().isNotEmpty) {
      try {
        await serviceLocator.signUp(
            email: event.email, password: event.password);

        await serviceLocator.createUser(name: event.name, email: event.email);

        emit(AuthSuccessState(
            msg:
                "Sign up completed successfully, please confirm your email before signing in."));
      } on AuthException catch (e) {
        print(e);
        emit(AuthErrorState(
            msg:
                "Failed to sign up: ${e.statusCode}. Please check your email and password."));
      } on Exception catch (e) {
        print(e);
        emit(AuthErrorState(msg: "Error occurred during sign up: $e"));
      }
    } else {
      emit(AuthErrorState(msg: "Please fill in all the required fields."));
    }
  }

  FutureOr<void> login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
      try {
        await serviceLocator.login(
            email: event.email, password: event.password);

        emit(AuthSuccessState(msg: "Login successful."));
      } on AuthException catch (e) {
        emit(AuthErrorState(
            msg:
                "Incorrect email/password: ${e.statusCode}. Please verify your credentials and try again."));
      } on Exception catch (e) {
        emit(AuthErrorState(msg: "An error occurred during login: $e"));
      }
    } else {
      emit(AuthErrorState(
          msg: "Please fill in both email and password fields."));
    }
  }

  FutureOr<void> getSession(
      CheckSessionAvailability event, Emitter<AuthState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    final sessionData = await serviceLocator.getCurrentSession();
    emit(SessionAvailabilityState(isAvailable: sessionData));
  }

  FutureOr<void> logout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    try {
      await serviceLocator.logout();
      emit(AuthSuccessState(msg: "Logout successful"));
    } catch (e) {
      emit(AuthErrorState(msg: "An error occurred during logout"));
    }
  }

  FutureOr<void> sendOtp(SendOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    if (event.email.trim().isNotEmpty) {
      try {
        await serviceLocator.sendOtp(email: event.email);
        serviceLocator.email = event.email;
        emit(AuthSuccessState(
            msg:
                "A password reset OTP has been sent to your email. Please check your inbox."));
      } on AuthException catch (e) {
        print(e);
        emit(AuthErrorState(
            msg: "Invalid email address. Please provide a valid email."));
      } on Exception catch (e) {
        print(e);
        emit(AuthErrorState(
            msg:
                "We encountered an issue while processing your request. Please try again later."));
      }
    } else {
      emit(AuthErrorState(msg: "Please provide your email address."));
    }
  }

  FutureOr<void> confirmOtp(
      ConfirmOtpEvent event, Emitter<AuthState> emit) async {
    if (event.otpToken.trim().isNotEmpty) {
      try {
        await serviceLocator.verifyOtp(
            email: event.email, otpToken: event.otpToken);
        emit(AuthSuccessState(
            msg: "OTP Confirmed, please enter your new password"));
      } on AuthException catch (e) {
        print(e);
        emit(AuthErrorState(msg: "Invalid OTP token, please try again"));
      } on Exception catch (e) {
        print(e);
        emit(AuthErrorState(
            msg: "There's an issue with our servers, please try again later"));
      }
    } else {
      emit(AuthErrorState(msg: "Please enter OTP"));
    }
  }

  FutureOr<void> updatePassword(
      ChangePasswordEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoadingState());
    if (event.password == event.confirmPassword) {
      if (event.password.trim().isNotEmpty && event.password.length >= 6) {
        try {
          await serviceLocator.changePassword(password: event.password);
          emit(AuthSuccessState(msg: "Password Successfully changed"));
          await serviceLocator.logout();
        } on AuthException catch (e) {
          print(e);
          emit(AuthErrorState(
              msg: "You're not authorized to change your password"));
        } on Exception catch (e) {
          print(e);
          emit(AuthErrorState(
              msg:
                  "There's an issue with our servers, please try again later"));
        }
      } else {
        emit(AuthErrorState(
            msg: "Please input your password (6 characters or more)"));
      }
    } else {
      emit(AuthErrorState(
          msg:
              "Passwords do not match. Please make sure your passwords match."));
    }
  }

  FutureOr<void> resendOtp(
      ResendOtpEvent event, Emitter<AuthState> emit) async {
    try {
      await serviceLocator.resend();
      emit(
          AuthSuccessState(msg: "OTP resent to ${serviceLocator.email}"));
    } catch (e) {
      emit(AuthErrorState(msg: "OTP could not be sent..."));
    }
  }
}
