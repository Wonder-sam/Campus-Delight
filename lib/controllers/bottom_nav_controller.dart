import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone/home/homepage_tabs.dart';

class BottomNavController extends GetxController {
  List texts = [
    {
      'title': "Home",
      'element': HomePageTabs(),
    },
    {
      'title':"Search",
      'element':const Text("Search")
    },
    {
      'title':"Order",
      'element':const Text("Order")
    },
    {
      'title':"Profile",
      'element':const Text("Profile")
    },
  ];

  int selectedIndex = 0;

  void switchTab(int index) {
    selectedIndex = index;
    update();
  }

}
