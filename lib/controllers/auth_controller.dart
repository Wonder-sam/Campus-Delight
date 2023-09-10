import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/firebase/firebase_functions.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, bool>((ref) => AuthNotifier());

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false) {
    fetchAuthState();
  }

  fetchAuthState() {
    auth.authStateChanges().listen((User? user) {
      if (user != null) {
        state = true;
        print(user);
      } else {
        state = false;
      }
    });
  }
}
