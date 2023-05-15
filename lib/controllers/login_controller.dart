import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  TextEditingController usernameOrEmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameOrEmail = '';
  String password = '';

  void setUsernameOrEmail(String text){
    usernameOrEmail = text;
    update();
  }

  void setPassword(String secret){
    password = secret;
    update();
  }
}