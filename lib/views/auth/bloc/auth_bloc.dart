import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:medicine_reminder_app/data_layer/data_layer.dart';
import 'package:medicine_reminder_app/service/supabase_services.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final serviceLocator = DataInjection().locator.get<section>();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<SignUpEvent>(signUpNewUser);
    on<LoginEvent>(login);
    on<CheckSessionAvailability>(getSession);
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

        emit(AuthSuccessState(msg: "Sign up completed successfully."));
      } on AuthException catch (e) {
        emit(AuthErrorState(
            msg:
                "Failed to sign up: ${e.statusCode}. Please check your email and password."));
      } on Exception catch (e) {
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
    await Future.delayed(Duration(seconds: 2));
    final sessionData = await serviceLocator.getCurrentSession();
    emit(SessionAvailabilityState(isAvailable: sessionData));
  }
}
