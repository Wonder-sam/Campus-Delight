import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zone/restaurant/restaurant_menu_item.dart';

class RestaurantPage extends StatelessWidget{
  const RestaurantPage({Key? key, required this.image, required this.name, required this.rating}): super(key: key);
  final double rating;
  final String image;
  final String name;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Restaurants")
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(40)
                  ),
                  color: Colors.blue
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.asset("assets/"+image,
                    width: double.infinity, fit: BoxFit.cover
                  )
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.only(top: 2, left: 1),
                  decoration: BoxDecoration(
                    color: Colors.yellow.shade900,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(40, 40)
                    )
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.elliptical(200, 200)
                    ),
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.only(top: 10, left: 30, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.star_half, color: Colors.yellow.shade800),
                          Text(rating.toString()),
                        ]
                      )
                    )
                  )
                )
              )
            ],
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('restaurants').doc('menu').collection(name).snapshots(),
            builder: (context, snapshot) {
              return !snapshot.hasData? const Text('Please Wait')
              : 
              ListView.builder(
                padding: const EdgeInsets.only(top:10),
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var menu =snapshot.data?.docs[index];
                  return RestaurantMenuItem(menuItemName: menu!['menuItemName'], menuItemImage: menu['menuItemImage'], 
                    menuItemDescription: menu['menuItemDescription'], restaurantName: name);
                }
              );
            }
          )
        ]
      )
    );
  }
}