import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/controllers/initial_screen_controller.dart';
import 'package:zone/controllers/theme_controller.dart';
import 'package:zone/home/homepage.dart';
import 'package:zone/screens/welcome.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(selectThemeProvider);
    final initialScreen = ref.watch(initialScreenProvider);
    return MaterialApp(
      title: 'Comfortite',
      theme: ThemeData(
        primarySwatch: theme["primary"],
        colorScheme: theme["themeBackground"],
      ),
      debugShowCheckedModeBanner: false,
      home: initialScreen,
    );
  }
}
