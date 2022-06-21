import 'package:flutter/material.dart';
import 'package:zone/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatelessWidget{
  BottomNavigation({Key? key}): super(key: key);
  final BottomNavController bncontroller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder:(value){
          return value.texts.elementAt(value.selectedIndex)['element'];
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavController>(
        builder: (cont) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem> [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                label: "Search", 
                icon: Icon(
                  Icons.search,
                ),
              ),
              BottomNavigationBarItem(
                label: "My Orders", 
                icon: Icon(
                  Icons.shopping_cart_outlined
                ),
              ),
              BottomNavigationBarItem(
                label: "Profile", 
                icon: Icon(
                  Icons.manage_accounts_outlined,
                ),
              ),
            ],
            showSelectedLabels: true,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.blue,
            currentIndex: cont.selectedIndex,
            onTap: cont.switchTab,
          );
        },
      )
    );
  }
}