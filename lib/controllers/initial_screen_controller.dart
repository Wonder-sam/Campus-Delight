import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/auth_controller.dart';
import 'package:zone/login.dart';

import 'bottom_navigation.dart';

final initialScreenProvider = Provider((ref) {
  bool isUserLoggedIn = ref.watch(authStateProvider);
  print(isUserLoggedIn);
  if (isUserLoggedIn) {
    return const BottomNavigator();
  } else {
    return const LoginPage();
  }
});
