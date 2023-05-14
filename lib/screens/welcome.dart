import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget{
  WelcomeScreen({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left:Get.width*0.02, right:Get.width*0.02, top:Get.width*0.1, bottom:Get.width*0.02),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: Get.height*0.55,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Get.width*0.1),
                      child: Image.asset(
                        "assets/welcome.JPG",
                        fit: BoxFit.cover,
                      )
                    )
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.brown.withAlpha(160),
                        borderRadius: BorderRadius.circular(Get.width*0.1)
                      ),
                    ),
                  )
                ],
              )
            ),
            Container(
              padding: EdgeInsets.only(top: Get.height*0.03, bottom: Get.height*0.05 ),
              height: Get.height*0.38,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Get.width*0.04, right: Get.width*0.04),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Welcome Foodie😀\n",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 26,
                          height: 2,
                          fontWeight: FontWeight.w600
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
                    width: Get.width*0.9,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(Get.width*0.03)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        MaterialButton(
                          onPressed: () => Get.toNamed('/login'),
                          textColor: Colors.white,
                          color: Colors.brown,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width*0.03)),
                          minWidth: Get.width*0.45,
                          height: Get.width*0.14,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () => null,
                          textColor: Colors.brown,
                          color: Colors.grey.shade200,
                          highlightColor: Colors.brown,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width*0.03)),
                          minWidth: Get.width*0.45,
                          height: Get.width*0.14,
                          elevation: 0,
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        )
                      ],
                    )
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}