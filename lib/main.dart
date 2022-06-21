import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zone',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const LoginPage(title: 'Zone'),
      debugShowCheckedModeBanner: false,
    );
  }
}