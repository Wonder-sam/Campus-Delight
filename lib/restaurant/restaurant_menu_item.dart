import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:zone/controllers/restaurant_list_controller.dart';
import 'package:zone/widgets/menu_container.dart';

class RestaurantMenuItem extends StatelessWidget{
  RestaurantMenuItem({Key? key, required this.menuItemName, required this.menuItemImage, 
  required this.menuItemDescription, required this.restaurantName}): super(key: key);
  final String menuItemName;
  final String menuItemImage;
  final String menuItemDescription;
  final String restaurantName;
  final RestaurantListController restaurantListController = Get.put(RestaurantListController());

  @override
  Widget build(BuildContext context){
    return GetBuilder<RestaurantListController>(
      init: RestaurantListController(),
      builder: (item){
        return !item.restaurantList.contains(restaurantName)? 
          MenuContainer(name: menuItemName, picture: menuItemImage, moreInfo: menuItemDescription) :
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child:ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child:  Slidable(
                key: const ValueKey(0),
                endActionPane:  const ActionPane(
                  extentRatio: 1,
                  motion: DrawerMotion(),
                  children: [
                    SlidableAction(
                      onPressed: null,
                      flex: 1,
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.check,
                      label: 'Order'
                    ),
                    SlidableAction(
                      onPressed: null,
                      flex: 1,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      icon: Icons.cancel,
                      label: 'Cancel'
                    ),
                  ]
                ),
                child: MenuContainer(name: menuItemName, picture: menuItemImage, moreInfo: menuItemDescription)
              )
            )
          );
      }
    );
  }
}