import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';

final emailProvider = StateProvider((ref) => "");
final loadingProvider = StateProvider((ref) => false);
final usernameProvider = StateProvider((ref) => "");
final signUpPasswordProvider = StateProvider((ref) => "");
final passwordVisibilityProvider = StateProvider((ref) => false);
final confirmPasswordProvider = StateProvider((ref) => "");
final confirmPasswordVisibilityProvider = StateProvider((ref) => false);
final passwordMatchProvider = StateProvider((ref) => false);
final passwordStrengthProvider = StateProvider((ref) => "weak");
final usernameErrorProvider = StateProvider((ref) => "");

final selectPasswordIconProvider = Provider<Icon>((ref) {
  Map<String, dynamic> theme = ref.watch(selectThemeProvider);
  final passwordVisibilityState = ref.watch(passwordVisibilityProvider);
  if (passwordVisibilityState == false) {
    return Icon(
      Icons.visibility_outlined,
      color: theme['inputFieldLabel'],
      size: 20,
    );
  } else {
    return Icon(
      Icons.visibility_off_outlined,
      color: theme['inputFieldLabel'],
      size: 20,
    );
  }
});

final selectConfirmPasswordIconProvider = Provider<Icon>((ref) {
  Map<String, dynamic> theme = ref.watch(selectThemeProvider);
  final confirmPasswordVisibilityState = ref.watch(confirmPasswordVisibilityProvider);
  if (confirmPasswordVisibilityState == false) {
    return Icon(
      Icons.visibility_outlined,
      color: theme['inputFieldLabel'],
      size: 20,
    );
  } else {
    return Icon(
      Icons.visibility_off_outlined,
      color: theme['inputFieldLabel'],
      size: 20,
    );
  }
});

//handle email
void emailHandler(String text, WidgetRef ref) {
  ref.read(emailProvider.notifier).state = text;
}

//handle username
void usernameHandler(String text, WidgetRef ref) async {
  int userExists = await checkIdUserExists(text);
  print(userExists);
  if (userExists > 0) {
    ref.read(usernameErrorProvider.notifier).state = "username already exists";
  } else {
    ref.read(usernameErrorProvider.notifier).state = "";
    ref.read(usernameProvider.notifier).state = text;
  }
}

//handle password
void signUpPasswordHandler(String text, WidgetRef ref) {
  ref.read(signUpPasswordProvider.notifier).state = text;
  String pass = ref.read(signUpPasswordProvider.notifier).state;
  pass = text;
  if (isStrong(pass)) {
    ref.read(passwordStrengthProvider.notifier).state = "strong";
  } else if (isMedium(pass)) {
    ref.read(passwordStrengthProvider.notifier).state = "medium";
  } else if (isWeak(pass)) {
    ref.read(passwordStrengthProvider.notifier).state = 'weak';
  } else if (isBad(pass)) {
    ref.read(passwordStrengthProvider.notifier).state = 'bad';
  }
}

// handle password confirmation
void confirmPasswordHandler(String text, WidgetRef ref) {
  ref.read(confirmPasswordProvider.notifier).state = text;
  if (ref.read(signUpPasswordProvider.notifier).state.compareTo(ref.read(confirmPasswordProvider.notifier).state) == 0) {
    ref.read(passwordMatchProvider.notifier).state = true;
  } else {
    ref.read(passwordMatchProvider.notifier).state = false;
  }
}

bool isBad(String text) {
  return containsOneType(text);
}

bool isWeak(String text) {
  return containsTwoDifferentTypes(text);
}

bool isMedium(String text) {
  return containsThreeDifferentTypes(text);
}

bool isStrong(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)'));
}

// bool containsUpperOrLower(String text){
//   return text.contains(RegExp(r'(?=.*[a-z])')) || text.contains(RegExp(r'(?=.*[A-Z])'));
// }

bool containsOneType(String text) {
  return containsCharacter(text) || containsLower(text) || containsNumber(text) || containsUpper(text);
}

bool containsTwoDifferentTypes(String text) {
  return containsLowerAndNumber(text) || containsNumberAndSpecialCharacter(text) || containsUpperAndLower(text) || containsUpperAndNumber(text);
}

bool containsThreeDifferentTypes(String text) {
  return containsLowerNumberCharacter(text) || containsLowerUpperCharacter(text) || containsUpperNumberCharacter(text) || containsUpperNumberLower(text);
}

bool containsLower(String text) {
  return text.contains(RegExp(r'(?=.*[a-z])'));
}

bool containsCharacter(String text) {
  return text.contains(RegExp(r'(?=.*\W)'));
}

bool containsNumber(String text) {
  return text.contains(RegExp(r'(?=.*\d)'));
}

bool containsUpper(String text) {
  return text.contains(RegExp(r'(?=.*[A-Z])'));
}

bool containsUpperAndLower(String text) {
  return text.contains(RegExp(r'(?=.*[A-Z])(?=.*[a-z])'));
}

bool containsUpperAndNumber(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[A-Z])'));
}

bool containsLowerAndNumber(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[a-z])'));
}

bool containsNumberAndSpecialCharacter(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*\W)'));
}

bool containsUpperNumberLower(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[A-Z])(?=.*[a-z])'));
}

bool containsUpperNumberCharacter(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[A-Z])(?=.*\W)'));
}

bool containsLowerNumberCharacter(String text) {
  return text.contains(RegExp(r'(?=.*\d)(?=.*[a-z])(?=.*\W)'));
}

bool containsLowerUpperCharacter(String text) {
  return text.contains(RegExp(r'(?=.*[a-z])(?=.*[A-z])(?=.*\W)'));
}
