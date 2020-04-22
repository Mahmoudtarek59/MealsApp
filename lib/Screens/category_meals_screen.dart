import 'package:flutter/material.dart';
import 'package:mealsapp/code/dummy_data.dart';
import 'package:mealsapp/code/state_management.dart';
import 'package:mealsapp/code/meal.dart';
import 'package:mealsapp/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  final String categoryId;
  final String categoryTitle;
  CategoryMealsScreen({this.categoryId, this.categoryTitle});

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {

  List<Meal> categoryMeals;
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    categoryMeals = DUMMY_MEALS.where((meal) {
      if(Provider.of<StateManagement>(context).gluten && !meal.isGlutenFree){
        return false;
      }
      if(Provider.of<StateManagement>(context).vegan && !meal.isVegan){
        return false;
      }
      if(Provider.of<StateManagement>(context).vegetarian && !meal.isVegetarian){
        return false;
      }
      if(Provider.of<StateManagement>(context).lactose && !meal.isLactoseFree){
        return false;
      }
      return meal.categories.contains(widget.categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
