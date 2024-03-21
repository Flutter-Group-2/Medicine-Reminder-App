import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class DBServices {
  //supabase client
  final supabase = Supabase.instance.client;

  String email = "";

  // ----- Auth ------

  //Sign up
  Future signUp({required String email, required String password}) async {
    await supabase.auth.signUp(
      password: password,
      email: email,
    );
  }

  //create user
  Future createUser({required String name, required String email}) async {
    await supabase.from('user').insert({'email': email, 'username': name});
  }

  //Login
  Future login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  //Logout
  Future logout() async {
    supabase.auth.signOut();
  }

  //get current session
  Future getCurrentSession() async {
    final session = supabase.auth.currentSession;
    return session;
  }

  //reset password
  Future resetPassword({required String email}) async {
    await supabase.auth.resetPasswordForEmail(
      email,
    );
  }

  //send OTP
  Future sendOtp({required String email}) async {
    await supabase.auth.signInWithOtp(
      email: email,
      shouldCreateUser: false,
    );
  }

  //verify OTP
  Future verifyOtp({required String email, required String otpToken}) async {
    await supabase.auth
        .verifyOTP(token: otpToken, type: OtpType.email, email: email);
  }

  Future resend() async {
    email = supabase.auth.currentSession!.user.email!;
    await supabase.auth.resend(type: OtpType.signup, email: email);
  }

  //Update user
  Future changePassword({required String password}) async {
    await supabase.auth.updateUser(UserAttributes(password: password));
  }
}
