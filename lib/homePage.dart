import 'package:flutter/material.dart';
import 'productList.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}): super(key: key);

  @override
   _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  final GlobalKey<ScaffoldState> _drawerscaffoldkey = GlobalKey<ScaffoldState>();

  static List texts = [
    {
      'title': "Home",
      'element': const ProductList(),
    },
    {
      'title':"Search",
      'element':const Text("Search")
    },
    {
      'title':"Order",
      'element':const Text("Order")
    },
    {
      'title':"Profile",
      'element':const Text("Profile")
    },
  ];

  int _selectedIndex = 0;
  void _switchTab(int index){
    setState((){
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed:(){
            _drawerscaffoldkey.currentState!.isDrawerOpen?Navigator.pop(context):_drawerscaffoldkey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu)
        ),
        title: Text(texts.elementAt(_selectedIndex)['title']),
        shape: const RoundedRectangleBorder(),
      ),
      body:Scaffold(
        key:_drawerscaffoldkey,
        drawer: const Drawer(
          child: Text("here")
        ),
        body: texts.elementAt(_selectedIndex)['element'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Search", 
              icon: Icon(
                Icons.search,
              ),
            ),
            BottomNavigationBarItem(
              label: "My Orders", 
              icon: Icon(
                Icons.shopping_cart_outlined
              ),
            ),
            BottomNavigationBarItem(
              label: "Profile", 
              icon: Icon(
                Icons.manage_accounts_outlined,
              ),
            ),
          ],
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          currentIndex: _selectedIndex,
          onTap: _switchTab,
        )
      ),
    );
  }
}

