import 'package:flutter/material.dart';
import 'package:mealsapp/code/dummy_data.dart';
import 'package:mealsapp/code/meal.dart';
import 'package:mealsapp/code/state_management.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  List<String> favoritMealsID;
  List<Meal> favoriteMeals;


  @override
  void didChangeDependencies() {
    favoritMealsID = Provider.of<StateManagement>(context).favoriteMeals;
    favoriteMeals = DUMMY_MEALS.where((meal) => favoritMealsID.contains(meal.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Provider.of<StateManagement>(context).favoriteMeals.isEmpty?Center(
      child: Text("You have no favorites yet - start adding some!"),
    ):ListView.builder(
      itemBuilder: (context, index) {
        return MealItem(
          id: favoriteMeals[index].id,
          title: favoriteMeals[index].title,
          imageUrl: favoriteMeals[index].imageUrl,
          affordability: favoriteMeals[index].affordability,
          complexity: favoriteMeals[index].complexity,
          duration: favoriteMeals[index].duration,
        );
      },
      itemCount: favoriteMeals.length,
    );
  }
}
