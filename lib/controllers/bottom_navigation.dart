import 'package:flutter/material.dart';
import 'package:zone/controllers/bottom_nav_controller.dart';
import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget{
  BottomNavigator({Key? key}): super(key: key);
  final BottomNavController bncontroller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: GetBuilder<BottomNavController>(init: BottomNavController(), builder:(controller){
          return controller.bottomTabPages.elementAt(controller.selectedIndex);
        }
      ),
      bottomNavigationBar: GetBuilder<BottomNavController>( builder: (controller) {
        return BottomNavigationBar(
          items: controller.getBottomTabs(),
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.brown,
          currentIndex: controller.selectedIndex,
          onTap: controller.switchTab,
        );
      })
    );
  }
}