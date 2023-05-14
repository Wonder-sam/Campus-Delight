import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(Get.width*0.1),
            child: Center(
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.cover,
                      alignment: Alignment.centerLeft,
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only( bottom:Get.width*0.03),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Log into your account",
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16
                      ),
                    )
                  ),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Username/Email",
                      labelStyle: const TextStyle(
                        color: Colors.brown,
                        fontSize: 14
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.9, color: Colors.brown)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      )
                    ),
                  ),
                  SizedBox(height: Get.height*0.03),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Colors.brown,
                        fontSize: 14
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.9, color: Colors.brown)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Get.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(Get.width*0.02),
                    width: double.maxFinite,
                    alignment: Alignment.centerRight,
                    child: const Text("Forgotten password?"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: Get.width*0.08),
                    child: MaterialButton(
                      onPressed: ()=>Get.toNamed("/bottomNavigator"),
                      color: Colors.brown,
                      minWidth: Get.width*0.8,
                      height: Get.width*0.15,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width*0.04)),
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "----------Other Sign In Options-----------",
                    style: TextStyle(
                      color: Colors.grey,
                      height: 3
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        alignment: Alignment.center,
                        onPressed: null, 
                        icon: FaIcon(FontAwesomeIcons.google, color: Colors.brown, size: Get.width*0.11,)
                      ),
                      SizedBox(width: Get.width*0.05),
                      IconButton(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(0),
                        onPressed: null, 
                        icon: Icon(Icons.apple, color: Colors.brown, size: Get.width*0.15,)
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: const [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: null,
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.brown
                          ),
                        )
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}