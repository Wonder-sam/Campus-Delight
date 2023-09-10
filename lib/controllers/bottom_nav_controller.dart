import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/home/homepage.dart';
import 'package:zone/home/homepage_toptabs.dart';
import 'package:zone/screens/profile/profile.dart';

class BottomNavController {
  List<BottomNavigationBarItem> bottomTabs = const [
    BottomNavigationBarItem(
      label: "Home",
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: "Search",
      icon: Icon(Icons.search),
    ),
    BottomNavigationBarItem(
      label: "Profile",
      icon: Icon(Icons.manage_accounts_outlined),
    ),
  ];

  List<BottomNavigationBarItem> getBottomTabs() {
    return bottomTabs;
  }
}

final selectedTabProvider = Provider<Widget>((ref) {
  int selectedIndex = ref.watch(selectedIndexProvider);
  switch (selectedIndex) {
    case 0:
      return const HomePage();
    case 1:
      return const Text("Search");
    case 2:
      return Profile();
    default:
      return const HomePageTabs();
  }
});

final selectedIndexProvider = StateProvider<int>((ref) => 0);

void switchTab(int index, WidgetRef ref) {
  ref.read(selectedIndexProvider.notifier).state = index;
}
