import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';
import 'package:zone/login.dart';
import 'package:zone/screens/createAccount.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/loading_acitivity.dart';

final emailProvider = StateProvider((ref) => "");
final loadingProvider = StateProvider((ref) => false);
final usernameProvider = StateProvider((ref) => "");
final passwordProvider = StateProvider((ref) => "");
final confirmPasswordProvider = StateProvider((ref) => "");
final passwordMatchProvider = StateProvider((ref) => false);
final passwordStrengthProvider = StateProvider((ref) => "weak");
final usernameErrorProvider = StateProvider((ref) => "");

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
void passwordHandler(String text, WidgetRef ref) {
  ref.read(passwordProvider.notifier).state = text;
  String pass = ref.read(passwordProvider.notifier).state;
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
  if (ref.read(passwordProvider.notifier).state.compareTo(ref.read(confirmPasswordProvider.notifier).state) == 0) {
    ref.read(passwordMatchProvider.notifier).state = true;
  } else {
    ref.read(passwordMatchProvider.notifier).state = false;
  }
}

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(passwordProvider);
    final username = ref.watch(usernameProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
    final passwordMatch = ref.watch(passwordMatchProvider);
    final passwordStrength = ref.watch(passwordStrengthProvider);
    final usernameError = ref.watch(usernameErrorProvider);
    final loading = ref.watch(loadingProvider);
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);

    void handleSignUp() async {
      if (usernameError == "" && passwordStrength != "weak" && email != "" && passwordMatch != false) {
        await signUpAndAddUser(email, password, username).then(
            (value) => {
                  if (value == "success")
                    {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateAccount(),
                        ),
                      )
                    }
                },
            onError: (e) => print(e));
      }
    }

    return Scaffold(
      appBar: null,
      backgroundColor: theme['background'],
      body: Stack(
        children: [
          ref.read(loadingProvider.notifier).state == true
              ? LoadingActivity()
              : Spacer(
                  flex: 1,
                ),
          SingleChildScrollView(
            padding: EdgeInsets.only(
              left: ScreenDimensions().dim_10(context),
              right: ScreenDimensions().dim_10(context),
              top: ScreenDimensions().dim_10H(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sign Up",
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                    textStyle: const TextStyle(
                      color: Colors.brown,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: ScreenDimensions().dim_05(context), bottom: MediaQuery.of(context).size.width * 0.03),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "Create new account",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                  ),
                ),
                TextField(
                  onChanged: (text) => emailHandler(text, ref),
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.9,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  onChanged: (text) => usernameHandler(text, ref),
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Username",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.9,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                  ),
                ),
                usernameError != ""
                    ? Container(
                        padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02,
                        ),
                        width: double.maxFinite,
                        alignment: Alignment.centerRight,
                        child: Text(
                          usernameError,
                        ),
                      )
                    : const SizedBox(
                        height: 0,
                      ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                TextField(
                  onChanged: (text) => passwordHandler(text, ref),
                  obscureText: true,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.9,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(
                    MediaQuery.of(context).size.width * 0.02,
                  ),
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Password strength: " + passwordStrength,
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: theme['inputFieldLabel'],
                      ),
                    ),
                  ),
                ),
                TextField(
                  onChanged: (text) => confirmPasswordHandler(text, ref),
                  obscureText: true,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.9,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.04,
                      ),
                      borderSide: BorderSide(
                        width: 0.5,
                        color: theme['inputFieldBorder'],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.02),
                  width: double.maxFinite,
                  alignment: Alignment.centerRight,
                  child: Text(
                    passwordMatch && confirmPassword != ''
                        ? "Passwords Match"
                        : !passwordMatch && confirmPassword != ''
                            ? "Passwords do not match"
                            : "",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: theme['inputFieldLabel'],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.05),
                  child: MaterialButton(
                    onPressed: () => handleSignUp(),
                    color: Colors.brown,
                    minWidth: ScreenDimensions().dim_80(context),
                    height: ScreenDimensions().dim_15(context),
                    textColor: Colors.white,
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Already have an account?",
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: theme['inputFieldLabel'],
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginPage(),
                        ),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.brown,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
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
