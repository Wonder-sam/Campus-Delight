import 'package:flutter/material.dart';
import 'package:zone/widgets/restaurant_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("restaurants").doc("restaurant").collection("restaurantList").snapshots(),
      initialData: null,
      builder: (context, snapshot) {
        return !snapshot.hasData? const Text("Empty")
          : ListView.builder(
            padding: const EdgeInsets.only(top:10),
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (context, index) {
            var restaurants =snapshot.data?.docs[index];
              return Column(
                children: [
                  RestaurantContainer(name: restaurants!['restaurantName'], image: restaurants['restaurantImage'], rating: restaurants['restaurantRating'].toDouble()),
                  Container(
                    padding: const EdgeInsets.only(left: 5, right:5),
                    width: MediaQuery.of(context).size.width*0.5,
                    child: const Divider(
                      color: Colors.black, 
                      thickness: 2, 
                    ),
                  ),
                ],
              );
            },
          );
      },
    );
  }
}
