import 'package:flutter/material.dart';
import 'package:mealsapp/Screens/categories_screen.dart';
import 'package:mealsapp/Screens/favorites_screen.dart';
import 'package:mealsapp/code/state_management.dart';
import 'package:mealsapp/widgets/drawer_widget.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    StateManagement().checkSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentIndex == 0 ? 'Categories' : 'Your Favorite'),
      ),
      body: _currentIndex == 0 ? CategoriesScreen(

      ) : FavoritesScreen(),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
//        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites"),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
