import 'package:get/get.dart';
import 'package:zone/controllers/bottom_navigation.dart';
import 'package:zone/screens/login.dart';
import 'package:zone/screens/welcome.dart';

class RouterHelper {
  static List<GetPage> routes=[
    GetPage(name: '/welcome', page: ()=> const WelcomeScreen()),
    GetPage(name: '/login', page: ()=> LoginPage()),
    GetPage(name: '/bottomNavigator', page: ()=> BottomNavigator())
  ];

  static List<GetPage> getRoutes(){
    return routes;
  }
}