import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/signup_controller.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';
import 'package:zone/login.dart';
import 'package:zone/screens/createAccount.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/loading_activity.dart';

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(emailProvider);
    final password = ref.watch(signUpPasswordProvider);
    final passwordVisibility = ref.watch(passwordVisibilityProvider);
    final username = ref.watch(usernameProvider);
    final confirmPassword = ref.watch(confirmPasswordProvider);
    final confirmPasswordVisibility = ref.watch(confirmPasswordVisibilityProvider);
    final passwordMatch = ref.watch(passwordMatchProvider);
    final passwordStrength = ref.watch(passwordStrengthProvider);
    final usernameError = ref.watch(usernameErrorProvider);
    final loading = ref.watch(loadingProvider);
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    Icon selectedPasswordIcon = ref.watch(selectPasswordIconProvider);
    Icon selectedConfirmPasswordIcon = ref.watch(selectConfirmPasswordIconProvider);

    void handleSignUp() async {
      ref.read(loadingProvider.notifier).state = true;
      if (usernameError == "" && passwordStrength != "weak" && email != "" && passwordMatch != false) {
        await signUpAndAddUser(email, password, username).then(
            (value) => {
                  if (value == "success")
                    {
                      ref.read(loadingProvider.notifier).state = false,
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const CreateAccount(),
                        ),
                      )
                    }
                },
            onError: (e) => print(e));
      } else {
        ref.read(loadingProvider.notifier).state = false;
      }
    }

    return Scaffold(
      appBar: null,
      backgroundColor: theme['background'],
      body: Stack(
        children: [
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
                      color: theme['inputFieldText'],
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
                      color: theme['inputFieldText'],
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
                  onChanged: (text) => signUpPasswordHandler(text, ref),
                  obscureText: !passwordVisibility,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldText'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => ref.read(passwordVisibilityProvider.notifier).state = !passwordVisibility,
                      icon: selectedPasswordIcon,
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
                  obscureText: !confirmPasswordVisibility,
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(
                      color: theme['inputFieldText'],
                    ),
                  ),
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(
                      color: theme['inputFieldLabel'],
                      fontSize: 14,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => ref.read(confirmPasswordVisibilityProvider.notifier).state = !confirmPasswordVisibility,
                      icon: selectedConfirmPasswordIcon,
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
          loading == true
              ? LoadingActivity()
              : Spacer(
                  flex: 1,
                ),
        ],
      ),
    );
  }
}
