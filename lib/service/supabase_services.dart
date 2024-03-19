import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  //supabase client
  final supabase = Supabase.instance.client;

  // ----- Auth ------

  //Sign up
  Future signUp(
      {required String username,
      required String email,
      required String password}) async {
    await supabase.auth.signUp(
      data: {'username': username},
      password: password,
      email: email,
    );
  }

  //Login
  Future login({required String email, required String password}) async {
    await supabase.auth.signInWithPassword(password: password, email: email);
  }

  //Logout
  Future signOut() async {
    supabase.auth.signOut();
  }
}
