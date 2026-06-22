import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {

  static final supabase = Supabase.instance.client;

  static Future<bool> login(String email, String password) async {
    final res = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    return res.user != null;
  }

  static Future<bool> register(String email, String password) async {
    final res = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    return res.user != null;
  }

  static Future<void> logout() async {
    await supabase.auth.signOut();
  }

  static User? get currentUser => supabase.auth.currentUser;
}
