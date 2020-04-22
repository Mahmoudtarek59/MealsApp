import 'package:flutter/material.dart';
import 'package:mealsapp/Screens/categories_screen.dart';
import 'package:mealsapp/Screens/filters_screen.dart';
import 'package:mealsapp/Screens/tabs_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).accentColor,
          child: Text(
            "Cooking Up!",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        ListTile(
          leading: Icon(
            Icons.restaurant,
            size: 26,
          ),
          title: Text(
            'Meals',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'RobotoCondensed'),
          ),
          onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> TabScreen())),
        ),
        ListTile(
          leading: Icon(Icons.filter_list),
          title: Text(
            'Filters',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'RobotoCondensed'),
          ),
          onTap: ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> FiltersScreen())),
        ),
      ],
    );
  }
}
