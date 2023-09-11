import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/controllers/login_controller.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/firebase/firebase_functions.dart';
import 'package:zone/screens/signup.dart';
import 'package:zone/utils/dimensions.dart';
import 'package:zone/widgets/snackbar.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usernameEmail = ref.watch(usernameEmailProvider);
    final password = ref.watch(passwordProvider);
    final passwordVisibility = ref.watch(loginPasswordVisibilityProvider);
    final shouldLogin = ref.watch(shouldLoginProvider);
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);
    Icon loginSelectedPasswordIcon = ref.watch(loginSelectPasswordIconProvider);

    void handleLogin() async {
      if (shouldLogin) {
        ScaffoldMessenger.of(context).showSnackBar(
          activitySnackbar(
            "Logging In",
            dim_90h(context) - 5,
            dim_05(context),
            theme,
          ),
        );
        String loginStatus = await login(usernameEmail, password);
        if (loginStatus == "success") {
          ScaffoldMessenger.of(context).showSnackBar(
            feedbackSnackbar(
              "Login successful",
              dim_90h(context) - 5,
              dim_05(context),
              const Icon(Icons.check_circle, color: Colors.green),
              theme,
            ),
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BottomNavigator(),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            feedbackSnackbar(
              loginStatus,
              dim_90h(context) - 5,
              dim_05(context),
              const Icon(Icons.error, color: Colors.red),
              theme,
            ),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          feedbackSnackbar(
            "Enter username/password",
            dim_90h(context) - 5,
            dim_05(context),
            const Icon(Icons.error, color: Colors.red),
            theme,
          ),
        );
      }
    }

    return Scaffold(
      appBar: null,
      backgroundColor: theme["background"],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(dim_10(context)),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: dim_80(context),
                    height: dim_25(context),
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Image.asset('assets/brunLong.png'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: dim_10(context), bottom: dim_100(context) * 0.03),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Log into your account",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ),
                  TextField(
                    onChanged: (text) => usernameEmailHandler(text, ref),
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme['inputFieldLabel'],
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: dim_10(context), top: 18, bottom: 18),
                      labelText: "Username/Email",
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: theme['inputFieldLabel'],
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(dim_20(context)),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(dim_20(context)),
                        borderSide: BorderSide(
                          width: 0.9,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(dim_20(context)),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: dim_05H(context)),
                  TextField(
                    onChanged: (text) => passwordHandler(text, ref),
                    obscureText: !passwordVisibility,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: theme['inputFieldLabel'],
                      ),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: dim_10(context), top: 18, bottom: 18),
                      labelText: "Password",
                      labelStyle: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: theme['inputFieldLabel'],
                          fontSize: 14,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => ref.read(loginPasswordVisibilityProvider.notifier).state = !passwordVisibility,
                        icon: loginSelectedPasswordIcon,
                        iconSize: 20,
                        padding: const EdgeInsets.only(right: 20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          dim_20(context),
                        ),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          dim_20(context),
                        ),
                        borderSide: BorderSide(
                          width: 0.9,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          dim_20(context),
                        ),
                        borderSide: BorderSide(
                          width: 0.5,
                          color: theme['inputFieldBorder'],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(dim_100(context) * 0.02),
                    width: double.maxFinite,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgotten password?",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          color: theme['inputFieldLabel'],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: dim_10H(context)),
                    child: MaterialButton(
                      onPressed: () => handleLogin(),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(dim_20(context))),
                      color: theme['inputFieldLabel'],
                      minWidth: dim_80(context),
                      height: dim_15(context),
                      textColor: Colors.white,
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: theme['background'],
                          ),
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
                        "Don't have an account?",
                        style: TextStyle(color: theme['inputFieldLabel']),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SignUpScreen())),
                        child: const Text(
                          "Sign up",
                          style: TextStyle(color: Colors.brown),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
