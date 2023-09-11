import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/bottom_nav_controller.dart';
import 'package:zone/controllers/theme_controller.dart';

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedIndexProvider);
    final selectedTab = ref.watch(selectedTabProvider);
    final theme = ref.watch(selectThemeProvider);

    return Scaffold(
      backgroundColor: theme['background'],
      body: selectedTab,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: theme['background'],
        items: BottomNavController().getBottomTabs(),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: theme['inputFieldLabel'],
        currentIndex: selectedIndex,
        onTap: (index) => switchTab(index, ref),
        elevation: 0,
      ),
    );
  }
}
