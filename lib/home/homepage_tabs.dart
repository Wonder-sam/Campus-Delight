import 'package:flutter/material.dart';
import 'package:zone/home/food.dart';
import 'package:zone/home/homepage.dart';
class HomePageTabs extends StatelessWidget{
   HomePageTabs({Key? key}): super(key: key);
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.brown,
            leading: IconButton(
              onPressed:(){
                _drawerscaffoldkey.currentState!.isDrawerOpen?Navigator.pop(context):_drawerscaffoldkey.currentState?.openDrawer();
              },
              icon: const Icon(Icons.menu)
            ),
          ),
          body: TabBarView(
            children: [
              const HomePage(),
              Food()
            ]
          )
        )
      )
    );
  }
}