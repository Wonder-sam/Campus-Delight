import 'package:flutter/material.dart';
import 'controllers/bottom_navigation.dart';

class LoginPage extends StatelessWidget {
  final String title;
  const LoginPage({Key? key, required this.title}) : super(key: key);
  // final items = Product.getProducts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(5),
            height: 50,
            width: 100,
            child: const Text("Login"),
          ),
          onTap:() {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavigation()));
          }
        )
      )
    );
  }
}
