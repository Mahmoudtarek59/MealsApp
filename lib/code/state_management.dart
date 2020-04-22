//Map<String,bool> filters={
//  'gluten':false,
//  'lactose':false,
//  'vegan':false,
//  'vegetarian':false,
//};

import 'package:flutter/cupertino.dart';
import 'package:mealsapp/code/SharedPreferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateManagement extends ChangeNotifier {
  bool gluten = false;
  bool lactose = false;
  bool vegan = false;
  bool vegetarian = false;

  List<String> favoriteMeals = [];

  StateManagement() {
    checkSavedData();
  }

  void checkSavedData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    try {
      if (pref.getBool('gluten') != null) {
        gluten = pref.getBool('gluten');
      }
      if (pref.getBool('lactose') != null) {
        lactose = pref.getBool('lactose');
      }
      if (pref.getBool('vegan') != null) {
        vegan = pref.getBool('vegan');
      }
      if (pref.getBool('vegetarian') != null) {
        vegetarian = pref.getBool('vegetarian');
      }
      if (pref.getStringList('MealIDs') != null) {
        favoriteMeals = pref.getStringList('MealIDs');
      }
    } catch (e) {
      print(e);
    }
    notifyListeners();
  }

  void setFilters({bool gluten, bool lactose, bool vegan, bool vegetarian}) {
    this.gluten = gluten;
    this.vegan = vegan;
    this.lactose = lactose;
    this.vegetarian = vegetarian;

    saveFilter(
        gluten: this.gluten,lactose: this.lactose,vegan: this.vegan,vegetarian: this.vegetarian);
    notifyListeners();
  }

  void setFavoiteMeal(String id) {
    favoriteMeals.add(id);

    saveFavorite(mealsId: favoriteMeals);
    notifyListeners();
  }

  void removeFavoiteMeal(String id) {
    favoriteMeals.remove(id);

    saveFavorite(mealsId: favoriteMeals);
    notifyListeners();
  }
}
