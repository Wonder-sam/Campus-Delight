import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/login.dart';
import 'package:zone/screens/signup.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Map<String, dynamic> theme = ref.watch(selectThemeProvider);

    return Scaffold(
      appBar: null,
      backgroundColor: theme['background'],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.02,
          right: MediaQuery.of(context).size.width * 0.02,
          top: MediaQuery.of(context).size.width * 0.1,
          bottom: MediaQuery.of(context).size.width * 0.02,
        ),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.1),
                          child: Image.asset(
                            "assets/welcome.JPG",
                            fit: BoxFit.cover,
                          ))),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown.withAlpha(160),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width * 0.1,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                bottom: MediaQuery.of(context).size.height * 0.05,
              ),
              height: MediaQuery.of(context).size.height * 0.38,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.04,
                      right: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Welcome Foodie😀\n",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 26,
                          height: 2,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: "Food is our common ground, a universal experience. There is no sincere love than the love for food. ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                          TextSpan(
                            text: "We will tantalize your taste buds🤤😋.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: theme['buttonWrapper'],
                      borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.03,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MaterialButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          ),
                          textColor: Colors.white,
                          color: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03,
                            ),
                          ),
                          minWidth: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.14,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          ),
                          textColor: Colors.brown,
                          color: theme["buttonWrapper"],
                          highlightColor: Colors.brown,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width * 0.03,
                            ),
                          ),
                          minWidth: MediaQuery.of(context).size.width * 0.45,
                          height: MediaQuery.of(context).size.width * 0.14,
                          elevation: 0,
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
