import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:zone/routes/routes.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await FirebaseAppCheck.instance.activate(
    webRecaptchaSiteKey: "recaptcha-v3-site-key",
    androidProvider: AndroidProvider.playIntegrity
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Comfortite',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeftWithFade,
      initialRoute: "/welcome",
      getPages: RouterHelper.getRoutes()
    );
  }
}