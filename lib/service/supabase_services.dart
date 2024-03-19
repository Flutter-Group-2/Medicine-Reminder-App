import 'dart:async';

import 'package:supabase_flutter/supabase_flutter.dart';

class DBService {
  //supabase client
  final supabase = Supabase.instance.client;

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
    await supabase.from('profiles').insert({'email': email, 'username': name});
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
