import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zone/restaurant/restaurant_menu_item.dart';

class RestaurantPage extends StatelessWidget{
  const RestaurantPage({Key? key, required this.image, required this.name}): super(key: key);
  
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              ),
              color: Colors.blue
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset("assets/"+image,
                width: double.infinity, fit: BoxFit.cover
              )
            ),
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