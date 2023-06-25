import 'package:flutter/material.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/utils/dimensions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(ScreenDimensions().dim_10(context)),
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: ScreenDimensions().dim_80(context),
                    height: ScreenDimensions().dim_25(context),
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                  ),
                  Container(
                    padding: EdgeInsets.only(top:ScreenDimensions().dim_10(context), bottom:MediaQuery.of(context).size.width*0.03),
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
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.9, color: Colors.brown)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      )
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        color: Colors.brown,
                        fontSize: 14
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.9, color: Colors.brown)
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.04),
                        borderSide: const BorderSide(width: 0.5, color: Colors.brown)
                      )
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.02),
                    width: double.maxFinite,
                    alignment: Alignment.centerRight,
                    child: const Text("Forgotten password?"),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.02),
                    child: MaterialButton(
                      onPressed: ()=>Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigator(),
                        ),
                      ),
                      color: Colors.brown,
                      minWidth: ScreenDimensions().dim_80(context),
                      height: ScreenDimensions().dim_15(context),
                      textColor: Colors.white,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
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