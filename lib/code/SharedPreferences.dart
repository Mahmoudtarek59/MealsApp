import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'dart:io';


Future<void> saveFilter({bool gluten,bool lactose, bool vegan,bool vegetarian})async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setBool('gluten',gluten);
  await pref.setBool('lactose',lactose);
  await pref.setBool('vegan',vegan);
  await pref.setBool('vegetarian',vegetarian);
}
Future<void> saveFavorite({List<String> mealsId})async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  await pref.setStringList('MealIDs', mealsId);
}