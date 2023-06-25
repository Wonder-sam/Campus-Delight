import 'package:flutter/material.dart';
import 'package:zone/controllers/restaurant_list_controller.dart';
import 'package:zone/widgets/food_tile.dart';

class Food extends StatelessWidget{
  Food({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context){
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width/(MediaQuery.of(context).size.height/1.35),
          ),
          itemCount: RestaurantListController().foodItems.length,
          itemBuilder: (context, index) {
            return FoodItem(foodItem: RestaurantListController().foodItems[index]);
          },
        );
  }
}