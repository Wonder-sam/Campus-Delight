import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zone/home/food.dart';
import 'package:zone/home/homepage.dart';
import 'package:zone/utils/dimensions.dart';

class HomePageTabs extends StatelessWidget {
  const HomePageTabs({Key? key}) : super(key: key);

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Explore'),
    Tab(text: 'New'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: ScreenDimensions().dim_60(context),
          leading: const TabBar(
            tabs: myTabs,
          ),
          title: Text(
            "Happy Mom",
            style: GoogleFonts.oleoScript(
              textStyle: const TextStyle(),
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: TabBarView(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const HomePage(),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Food(),
            ),
          ],
        ),
      ),
    );
  }
}
