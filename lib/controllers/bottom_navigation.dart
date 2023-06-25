import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zone/controllers/bottom_nav_controller.dart';

final selectedIndexProvider = StateProvider<int>((ref) => 0);

void switchTab(int index, WidgetRef ref) {
  ref.read(selectedIndexProvider.notifier).state = index;
}
class BottomNavigator extends ConsumerWidget{
  const BottomNavigator({Key? key}): super(key: key);
  
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final selectedIndex = ref.watch(selectedIndexProvider);
    return Scaffold(
      body: BottomNavController().bottomTabPages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: BottomNavController().getBottomTabs(),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.brown,
        currentIndex: selectedIndex,
        onTap: (index)=>switchTab(index, ref),
      ),
    );
  }
}