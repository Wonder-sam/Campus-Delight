import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/theme_controller.dart';

final usernameEmailProvider = StateProvider<String>((ref) => "");
final passwordProvider = StateProvider<String>((ref) => "");
final loginPasswordVisibilityProvider = StateProvider((ref) => false);
final shouldLoginProvider = Provider<bool>((ref) {
  String username = ref.watch(usernameEmailProvider);
  String password = ref.watch(passwordProvider);
  if (password.isNotEmpty && username.isNotEmpty) {
    return true;
  }
  return false;
});
final loginActivityProvider = StateProvider<bool>((ref) => false);

final loginSelectPasswordIconProvider = Provider<Icon>((ref) {
  Map<String, dynamic> theme = ref.watch(selectThemeProvider);
  final passwordVisibilityState = ref.watch(loginPasswordVisibilityProvider);
  if (passwordVisibilityState == false) {
    return Icon(
      Icons.visibility_outlined,
      color: theme['inputFieldLabel'],
    );
  } else {
    return Icon(
      Icons.visibility_off_outlined,
      color: theme['inputFieldLabel'],
    );
  }
});

void usernameEmailHandler(String text, WidgetRef ref) {
  ref.read(usernameEmailProvider.notifier).state = text;
}

void passwordHandler(String text, WidgetRef ref) {
  ref.read(passwordProvider.notifier).state = text;
}

void clearLoginInfo(WidgetRef ref) {
  ref.read(passwordProvider.notifier).state = "";
  ref.read(usernameEmailProvider.notifier).state = "";
}
