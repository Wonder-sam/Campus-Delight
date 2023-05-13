import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zone/home/homepage_tabs.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  
  List bottomTabPages = [
    HomePageTabs(),
    const Text("Search"),
    const Text("Order"),
    const Text("Profile")
  ];

  List<BottomNavigationBarItem> bottomTabs =  const[
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon( Icons.home, color: Colors.brown),
    ),
    BottomNavigationBarItem(
      label: "Search", 
      icon: Icon(Icons.search, color: Colors.brown),
    ),
    BottomNavigationBarItem(
      label: "My Orders", 
      icon: Icon(Icons.shopping_cart_outlined, color: Colors.brown),
    ),
    BottomNavigationBarItem(
      label: "Profile", 
      icon: Icon( Icons.manage_accounts_outlined, color: Colors.brown),
    ),
  ];

  void switchTab(int index) {
    selectedIndex = index;
    update();
  }

  List<BottomNavigationBarItem> getBottomTabs(){
    return bottomTabs;
  }

}
