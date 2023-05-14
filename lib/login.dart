import 'package:flutter/material.dart';
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
                    width: Get.width*0.8,
                    height: Get.width*0.25,
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    padding: EdgeInsets.only(top:Get.width*0.1, bottom:Get.width*0.03),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Log into your account",
                      style: TextStyle(
                        color: Colors.grey,
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
                    padding: EdgeInsets.only(top: Get.width*0.02),
                    child: MaterialButton(
                      onPressed: ()=>Get.toNamed("/bottomNavigator"),
                      color: Colors.brown,
                      minWidth: Get.width*0.8,
                      height: Get.width*0.15,
                      textColor: Colors.white,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
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
              )
            )
          ),
        )
      )
    );
  }
}