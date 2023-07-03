import 'package:flutter/material.dart';
import 'package:zone/home/homepage_toptabs.dart';

class BottomNavController {
  
  final bottomTabPages = [
    const HomePageTabs(),
    const Text("Search"),
    const Text("Order"),
    const Text("Profile")
  ];

  List<BottomNavigationBarItem> bottomTabs =  const[
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon( Icons.home),
    ),
    BottomNavigationBarItem(
      label: "Search", 
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: "My Orders", 
      icon: Icon(Icons.shopping_cart_outlined),
    ),
    BottomNavigationBarItem(
      label: "Profile", 
      icon: Icon( Icons.manage_accounts_outlined),
    ),
  ];



  List<BottomNavigationBarItem> getBottomTabs(){
    return bottomTabs;
  }

}
