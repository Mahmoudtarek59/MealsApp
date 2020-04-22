import 'dart:ui';

import 'package:flutter/material.dart';
import 'file:///E:/flutter/Course/Flutter/projects/meals_app/lib/Screens/categories_screen.dart';
import 'package:mealsapp/Screens/tabs_screen.dart';
import 'package:mealsapp/code/state_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<StateManagement>(
      create: (context)=>StateManagement(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TabScreen(),
        title: "DeliMeals",
        theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254,229,1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(color: Color.fromRGBO(20,51,51,1)),
            body2: TextStyle(color: Color.fromRGBO(20,51,51,1)),
            title: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily: 'RobotoCondensed'),
          ),
        ),
      ),
    ),
  );
}
